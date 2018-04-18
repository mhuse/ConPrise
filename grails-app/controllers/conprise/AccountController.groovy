package conprise

import grails.plugins.springsecurity.Secured

@Secured(["ROLE_COMPANY"])
class AccountController {
    def accountService
    def springSecurityService

    def index() {
        def firstLogin = springSecurityService.currentUser.firstLogin
        def info = Info?.get(1)
        if (firstLogin) {
            redirect(action: 'recomendation')
            accountService.secondLogin(springSecurityService.currentUser)
        }
        [info: info]
    }

    def watchPurshaseQuotation() {
        def quot = PurshaseForm?.findByIdAndStatus(params?.getLong('id'), 2)
        accountService.openNotification(springSecurityService.currentUser, params?.getLong('notification'))
        if (quot) {
            def products = PurshaseFormProduct?.findAllByPursaseFormAndStatus(quot, 1)
            [quot: quot, products: products]
        } else {
            redirect(action: 'index')
        }
    }

    def watchPurshaceOrder() {
        def quot = SalesForm?.findByIdAndStatusGreaterThan(params?.getLong('id'), 1)
        accountService.openNotification(springSecurityService.currentUser, params?.getLong('notification'))
        if (quot?.purshaseForm?.user?.id == springSecurityService.currentUser.id) {
            def products = SalesFormProduct?.findAllBySalesFormAndStatus(quot, 1)
            def comments = Comment?.findAllBySalesForm(quot)
            [salesForm: quot, products: products, comments: comments, currentUser: springSecurityService.currentUser]
        } else {
            redirect(action: 'index')
        }
    }

    def submitPurshaceOrder() {
        accountService.submitPurshaceOrder(params, springSecurityService.currentUser)
        redirect(action: 'purshaceQuatationList')
    }

    def salesQuotationProducts() {
        def salesForm = SalesForm?.findByUserAndIdAndStatusGreaterThan(springSecurityService.currentUser, params?.getLong('id'), 0)
        def products = SalesFormProduct?.findAllBySalesFormAndStatusGreaterThan(salesForm, 0)
        def comments = Comment?.findAllBySalesForm(salesForm)
        [products: products, salesForm: salesForm, comments: comments, currentUser: springSecurityService.currentUser]
    }

    def deleteSalesQuotProduct() {
        accountService?.deleteSalesQuotProduct(params, springSecurityService.currentUser)
        redirect(action: 'salesQuatationList')
    }


    def search() {
        def companies = User?.findAllByVoenLikeOrNameLikeOrUsernameLikeOrDescriptionLike('%'
                + params?.q + '%', '%' + params?.q + '%', '%' + params?.q + '%', '%' + params?.q + '%', [enabled: true])
        companies.remove(springSecurityService.currentUser)
        [foundcompanies: companies, currentUser: springSecurityService.currentUser]
    }


    def companies() {
        def companies = User?.findAllByEnabledAndVoenSubmitted(true, true)
        companies.remove(springSecurityService.currentUser)
        [foundcompanies: companies, currentUser: springSecurityService.currentUser]
    }

    def notifications() {
        def notifications = Notification?.findAllByUserAndStatus(springSecurityService.currentUser, 1, [sort: 'id', order: 'desc'])
        [notifications: notifications]
    }

    def purshaseRequestProducts() {
        def form = PurshaseForm?.findByUserAndId(springSecurityService.currentUser, params?.getLong('id'))
        def products = PurshaseFormProduct?.findAllByPursaseFormAndStatus(form, 1)
        [products: products]
    }

    def submitQuotation() {
        accountService.submitQuotation(params, springSecurityService.currentUser)
        params?.message = 'You have created new purshase quotation !'
        redirect(action: 'index')
    }

    def addPurshaseRequestProduct() {
        def product
        def products = Product.findAllByUserAndStatusGreaterThan(springSecurityService.currentUser, 0)
        def purchaseRequestProducts = PurshaseForm?.findByUserAndIdAndStatusGreaterThan(springSecurityService.currentUser, params?.getLong('quotationId'), 0)?.products.findAll { productofform -> productofform.status > 0 }?.product
        if (params?.getLong('id')) {
            product = PurshaseFormProduct.get(params?.getLong('id'))
            if (product.pursaseForm.user.id != springSecurityService.currentUser.id) {
                product = null
            }
        }
        [product: product, products: products, purchaseRequestProducts: purchaseRequestProducts]

    }

    def savePurhsaseRequestProduct() {
        accountService.savePurhsaseRequestProduct(params, springSecurityService.currentUser)
        redirect(action: 'purshaceRequestList',params: [message:'Product added !'])
    }

    def removePurshaseFormProduct() {
        def product = PurshaseFormProduct?.get(params?.getLong('id'))
        if (product.pursaseForm.user.id == springSecurityService.currentUser.id) {
            accountService.removePurshaseFormProduct(product)
        }
        redirect(action: 'purshaseRequestProducts',params: [message:'Company info saved !', 'id': product.pursaseForm.id])
    }

    def addPurshaseRequest() {
        def quotation
        if (params?.getLong('id')) {
            quotation = PurshaseForm.findByIdAndUserAndStatus(params?.getLong('id'), springSecurityService.currentUser, 1)
        }
        [quotation: quotation, products: Product?.findAllByUserAndStatus(springSecurityService.currentUser, 1)]
    }

    def purshaceRequestList() {
        def quotations = PurshaseForm.findAllByUserAndStatusGreaterThan(springSecurityService.currentUser, 0)
        [quotations: quotations]
    }

    def salesQuatationList() {
        def quotations
        if (params.getLong('id')) {
            quotations = SalesForm?.executeQuery("select f from SalesForm f where f.user.id=:userid and f.status>0 and f.purshaseForm.user.id=:puserid", ['userid': springSecurityService.currentUser, 'puserid': params?.getLong('id')])
        } else {
            quotations = SalesForm.findAllByUserAndStatusGreaterThan(springSecurityService.currentUser, 0)
        }
        [quotations: quotations]
    }

    def submitSalesQuotation() {
        accountService.submitSalesQuotation(params, springSecurityService.currentUser)
        redirect(action: 'salesQuatationList')
    }

    def savePurhsaseQuatation() {
        accountService.savePurhsaseQuatation(params, springSecurityService.currentUser)
        redirect(action: 'purshaceRequestList',params: [message:'You have created new purshase request !'])
    }

    def saveSalesQuatation() {
        def id = accountService.saveSalesQuatation(params, springSecurityService.currentUser)
        if (params?.id) {
            redirect(action: 'salesQuatationList',params: [message:'You have created new sales quotation !'])
        } else {
            redirect(action: 'addProductToSalesQuotation',params: [message:'You have created new sales quotation !', 'id': id])
        }
    }

    def addProductToSalesQuotation() {
        def salesQuotation = SalesForm?.findByUserAndStatusAndId(springSecurityService.currentUser, 1, params?.getLong('id'))
        if (salesQuotation) {
            def purshaseFormProducts = PurshaseFormProduct?.findAllByPursaseFormAndStatus(salesQuotation?.purshaseForm, 1)
            def salesFormProducts = SalesFormProduct?.findAllBySalesFormAndStatus(salesQuotation, 1)
            [sq: salesQuotation, pProducts: purshaseFormProducts, sProducts: salesFormProducts]
        } else {
            redirect(action: 'salesQuatationList')
        }
    }

    def saveProductToSalesQuotation() {
        accountService.saveProductToSalesQuotation(params, springSecurityService.currentUser)
        redirect(action: 'salesQuatationList',params: [message:'Product added!'])
    }

    def addSalesQuotation() {
        def quotation
        if (params?.getLong('id')) {
            quotation = SalesForm.findByIdAndUserAndStatus(params?.getLong('id'), springSecurityService.currentUser, 1)
        }
        [quotation: quotation]
    }

    def addFriend() {
        def companyname = accountService.addFriend(params, springSecurityService.currentUser)
        if (params?.q) {
            redirect(action: 'search', params: [q: params?.q, message: 'You sent friend request to ' + companyname])
        } else {
            redirect(action: 'companies', params: [message: 'You sent friend request to ' + companyname])
        }
    }


    def deleteFriend() {
        def companyname = accountService.deleteFriend(params, springSecurityService.currentUser)
        if (params?.q) {
            redirect(action: 'search', params: [q: params?.q, message: 'Deleted !'])
        } else {
            redirect(action: 'companies', params: [message: 'Deleted !'])
        }

    }

    def addProduct() {
        def product
        if (params?.getLong('id')) {
            product = Product?.findByIdAndUser(params?.getLong('id'), springSecurityService.currentUser)
        }
        [product: product, categories: Category?.findAllByStatus(1)]
    }

    def removeProduct() {
        accountService.removeProduct(params, springSecurityService.currentUser)
        redirect(action: 'productList',params: [message:'Product deleted !'])
    }

    def productList() {
        def products = Product?.findAllByUserAndStatus(springSecurityService.currentUser, 1)
        [products: products]
    }

    def saveProduct() {
        accountService.saveProduct(params, request, springSecurityService.currentUser)
        redirect(action: 'productList',params: [message:'Product saved !'])
    }

    def leftNav() {
        def productCount = Product?.countByUserAndStatus(springSecurityService.currentUser, 1)
        def friendRequest = Friend.countByUser2AndStatus(springSecurityService.currentUser, 0)
        def friendscount = Friend.countByUser1OrUser2(springSecurityService.currentUser, springSecurityService.currentUser, [status: 1])
        def notificationCount = Notification?.countByUserAndStatus(springSecurityService.currentUser, 1)
        def notifications = Notification?.findAllByUserAndStatus(springSecurityService.currentUser, 1, [sort: 'id', order: 'desc', max: 10])
        [productCount: productCount, notificationCount: notificationCount, friendRequest: friendRequest,
         friendscount: friendscount, companycount: User?.countByEnabledAndVoenSubmitted(true, true),
         notifications: notifications, user: springSecurityService.currentUser]
    }

    def headerNav() {
        [user: springSecurityService.currentUser]
    }

    def friendRequests() {
        def friendRequests = Friend?.findAllByUser2AndStatus(springSecurityService.currentUser, 0)
        [friendRequests: friendRequests]
    }

    def deleteFriendRequest() {
        accountService.deleteFriendRequest(params, springSecurityService.currentUser)
        redirect(action: 'friendRequests')
    }

    def acceptFriendRequest() {
        accountService.acceptFriendRequest(params, springSecurityService.currentUser)
        redirect(action: 'friendRequests',params: [message:'Friend request accepted'])
    }

    def deletePurshaseQuotation() {
        accountService.deletePurshaseQuotation(params, springSecurityService.currentUser)
        redirect(action: 'purshaceQuatationList',params: [message:'Purshace request deleted!'])
    }

    def deleteSalesQuotation() {
        accountService.deleteSalesQuotation(params, springSecurityService.currentUser)
        redirect(action: 'purshaceQuatationList',params: [message:'Sales quotation deleted!'])
    }

    def trigger() {
        new NotificationType(text: "sizə dostluq təklifi göndərdi !", type: "friendRequest").save(flush: true, failOnError: true)
//        new NotificationType(text: 'şirkəti yeni alış sənədi yaratdı !',type:'friendRequest').save(flush: true,failOnError: true)
//        new NotificationType(text: 'şirkəti sizin məhsul üçün satış sənədi yaratdı !').save(flush: true,failOnError: true)
//        new NotificationType(text: 'şirkəti sizə satış üçün razılaşma göndərdi !').save(flush: true,failOnError: true)
//        new NotificationType(text: 'Yeni razılaşmanı qəbul etmək üçün daxil olun.').save(flush: true,failOnError: true)
    }

    def purshaceQuatationList() {
        def purshaceRequests = PurshaseForm?.findAllByStatusAndUser(2, springSecurityService.currentUser)
        def sf = SalesForm?.findAllByPurshaseFormInListAndStatusGreaterThan(purshaceRequests, 1)
        [quotations: sf]
    }

    def purshaceOrderList() {
        def purshaceRequests = PurshaseForm?.findAllByStatusAndUser(2, springSecurityService.currentUser)
        def sf = SalesForm?.findAllByPurshaseFormInListAndStatusGreaterThan(purshaceRequests, 2)
        [quotations: sf]
    }

    def salesOrderList() {
        def salesOrders
        if (params?.getLong('id')) {
            salesOrders = SalesForm?.executeQuery("select  sf from SalesForm  sf where sf.status>2 and sf.user.id=:userid and sf.purshaseForm.user.id=:pfuserid", ['userid': springSecurityService.currentUser.id, 'pfuserid': params?.getLong('id')])
        } else {
            salesOrders = SalesForm?.findAllByUserAndStatusGreaterThan(springSecurityService.currentUser, 2)
        }
        [salesOrders: salesOrders]
    }

    def watchSalesOrder() {
        def salesForm = SalesForm?.findByIdAndUserAndStatusGreaterThan(params?.getLong('id'), springSecurityService.currentUser, 2)
        def products = SalesFormProduct?.findAllBySalesFormAndStatus(salesForm, 2)
        def comments = Comment?.findAllBySalesForm(salesForm)
        accountService.openNotification(springSecurityService.currentUser, params?.getLong('notification'))
        [salesForm: salesForm, products: products, comments: comments, currentUser: springSecurityService.currentUser]
    }

    def profile() {
        def user
        if (params?.getLong('id')) {
            user = User?.findByIdAndEnabled(params?.getLong('id'), true)
        } else {
            user = springSecurityService.currentUser
        }
        def interests = Interest.findAll()
        if (!user) {
            redirect(action: 'index')
        }
        accountService.openNotification(springSecurityService.currentUser, params?.getLong('notification'))
        [user: user, currentUser: springSecurityService.currentUser, interests: interests]
    }

    def submitSalesOrder() {
        accountService.submitSalesOrder(params, springSecurityService.currentUser)
        redirect(action: 'soldTrackingDocuments')
    }

    def soldTrackingDocuments() {
        def docs
        accountService.openNotification(springSecurityService.currentUser, params?.getLong('notification'))
        if (params?.getLong('id')) {
            docs = SalesForm?.executeQuery("select s from SalesForm s where s.user.id=:id and s.status>3 and s.purshaseForm.user.id=:fuserid", [id: springSecurityService.currentUser.id, 'fuserid': params?.getLong('id')])
        } else {
            docs = SalesForm?.executeQuery("select s from SalesForm s where s.user.id=:id and s.status>3", [id: springSecurityService.currentUser.id])
        }
        [docs: docs]
    }

    def boughtTrackingDocuments() {
        def docs = SalesForm?.executeQuery("select s from SalesForm s where s.purshaseForm.user.id=:id and s.status>3", [id: springSecurityService.currentUser.id])
        accountService.openNotification(springSecurityService.currentUser, params?.getLong('notification'))
        [docs: docs]
    }

    def trackingProducts() {
        def salesForm = SalesForm?.findById(params?.getLong('id'))
        def products = SalesFormProduct?.findAllByStatusGreaterThanAndSalesForm(1, salesForm)?.purhshaseFormProduct?.product
        def comments = Comment?.findAllBySalesForm(salesForm)
        [products: products, comments: comments, currentUser: springSecurityService.currentUser]
    }

    def submitdelivery() {
        accountService.submitdelivery(params)
        redirect(action: 'boughtTrackingDocuments',params: [message:'Submitted!'])
    }

    def createInvoice() {
        accountService.createInvoice(params)
        redirect(action: 'soldTrackingDocuments')
    }

    def salesInvoiceList() {
        def docs
        accountService.openNotification(springSecurityService.currentUser, params?.getLong('notification'))
        if (params?.getLong('id')) {
            docs = SalesForm?.executeQuery("select s from SalesForm s where s.user.id=:id and s.status>5 and s.purshaseForm.user.id=:pfuserid", [id: springSecurityService.currentUser.id, 'pfuserid': params?.getLong('id')])
        } else {
            docs = SalesForm?.executeQuery("select s from SalesForm s where s.user.id=:id and s.status>5", [id: springSecurityService.currentUser.id])
        }
        [docs: docs]
    }

    def purshaceInvoiceList() {
        def docs = SalesForm?.executeQuery("select s from SalesForm s where s.purshaseForm.user.id=:id and s.status>5", [id: springSecurityService.currentUser.id])
        accountService.openNotification(springSecurityService.currentUser, params?.getLong('notification'))
        [docs: docs]
    }

    def invoiceProducts() {
        def salesForm = SalesForm?.findByIdAndStatusGreaterThan(params?.getLong('id'), 5)
        def products = SalesFormProduct?.findAllBySalesFormAndStatusGreaterThan(salesForm, 1)
        def discount = 0
        for (p in products) {
            discount += p?.price/100*p?.discount*p?.numberOfProduct
        }
        accountService.openNotification(springSecurityService.currentUser, params?.getLong('notification'))
        accountService.openNotification(springSecurityService.currentUser, params?.getLong('notification'))
        def comments = Comment?.findAllBySalesForm(salesForm)
        double pricesum
        for(p in products){
            pricesum+=p.price*p.numberOfProduct
        }
        [pricesum:pricesum,products: products, user: springSecurityService.currentUser,
         salesForm: salesForm, discount: discount, comments: comments, currentUser: springSecurityService.currentUser]
    }

    def submitInvoice6() {
        accountService.submitInvoice6(params)
        redirect(action: 'invoiceProducts',params: [message:'Submitted!',id: params?.id])
    }

    def submitInvoice7() {
        accountService.submitInvoice7(params)
        redirect(action: 'invoiceProducts',params: [message:'Submitted!',id: params?.id])
    }

    def saveProfilePicture() {
        accountService.saveProfilePicture(params, request)
        redirect(action: 'profile',params: [message:'Prodile picture saved !','id': springSecurityService.currentUser.id])
    }

    def saveCompanyInfo() {
        accountService.saveCompanyInfo(params)
        redirect(action: 'profile',params: [message:'Company info saved !'])
    }

    def friendList() {
        def friends = Friend.executeQuery("select f from Friend f where (f.user1=:u1 or f.user2=:u2) and f.status=1",['u1':springSecurityService.currentUser,'u2':springSecurityService.currentUser]);
        [friends: friends, currentUser: springSecurityService.currentUser]
    }
//    def comments(){
//        def salesForm=SalesForm?.get(params?.getLong('id'))
//        def comments=Comment?.findAllBySalesForm(salesForm)
//        def user=springSecurityService.currentUser
//        [comments:comments,currentUser: user]
//    }
    def submitComment() {
        accountService.submitComment(params, springSecurityService.currentUser)
        redirect(uri: request.getHeader("referer"))
    }

    def recomendation() {
        def currentUser = springSecurityService.currentUser
        def companies = User?.findAllByEnabled(true)
        accountService.secondLogin(currentUser)
        [companies: companies, currentUser: currentUser]
    }
}