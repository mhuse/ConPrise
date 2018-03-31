package adastudent

import ada.Category
import ada.Comment
import ada.Friend
import ada.Notification
import ada.NotificationType
import ada.Product
import ada.PurshaseForm
import ada.PurshaseFormProduct
import ada.SalesForm
import ada.SalesFormProduct
import ada.User

class AccountService {
    def springSecurityService
    def burningImageService

    def saveProduct(params, request, user) {
        def product
        if (params?.id) {
            product = Product?.findByIdAndUser(params?.getLong('id'), user)
        } else {
            product = new Product()
        }
        product?.name = params?.name
        product?.category = Category?.get(params?.getLong('category'))
        product?.status = 1
        product?.user = user


        def files = request.getFiles("file")
        if (files) {
            for (file in files) {
                if (file && !file.empty) {
                    def matcher = (file.getOriginalFilename() =~ /.*\.(.*)$/)
                    def extension
                    if (matcher.matches()) {
                        extension = matcher[0][1]
                    }
                    if (extension == 'jpeg' || extension == 'gif' || extension == 'png' || extension == 'bmp' || extension == 'jpg' || extension == 'JPG' || extension == 'JPEG' || extension == 'PNG') {
                        String fileName = UUID.randomUUID().toString().toLowerCase() + "." + extension
                        String dir = "/home/projects/ada/product/images"
                        def filePath = new File(dir)
                        filePath.mkdirs()
                        file.transferTo(new File(filePath, fileName))
                        product?.image = fileName
                        CropImage(dir, fileName)
                    } else {

                    }
                }

            }
        }

        product.save(flush: true, failOnError: true)

    }

    def submitPurshaceOrder(params, user) {
        def salesForm = SalesForm?.findByIdAndStatus(params?.getLong('id'), 2)
        if (salesForm?.purshaseForm?.user == user) {
//        def products=SalesFormProduct?.findAllBySalesFormAndStatus(salesForm,1)
            def products = params?.list('productId')
            for (productId in products) {
                def product = SalesFormProduct?.findByIdAndStatusAndSalesForm(Long.parseLong(productId), 1, salesForm)
                product?.status = 2
                product?.save(flush: true, failOnError: true)
            }
            salesForm?.status = 3
            salesForm?.save(flush: true, failOnError: true)
            new Notification(
                    type: NotificationType?.findByType("salesorder"),
                    formId: params?.id,
                    status: 1,
                    user: salesForm?.user)?.save(flush: true, failOnError: true)
        }
    }

    def secondLogin(currentUser) {
        currentUser.firstLogin = true
        currentUser.save(flush: true, failOnError: true)
    }

    def submitQuotation(params, user) {
        def quotation = PurshaseForm?.findByUserAndId(user, params?.getLong('id'))
        quotation?.status = 2
        def friends = Friend.findAllByUser1AndStatus(user, 1).user2 + Friend.findAllByUser2AndStatus(user, 1).user1
        def notificationType = NotificationType.findByType('purshasequotation')
        for (friend in friends) {
            new Notification(
                    type: notificationType,
                    formId: params?.id,
                    status: 1,
                    user: friend)?.save(flush: true, failOnError: true)
        }
    }

    def savePurhsaseRequestProduct(params, user) {
        def quotation = PurshaseForm?.findByUserAndId(user, params?.getLong('quotationId'))
        def product
        if (params?.id) {
            product = PurshaseFormProduct.findByIdAndPursaseForm(params?.getLong('id'), quotation)
        } else {
            product = new PurshaseFormProduct()
        }
        product?.product = Product?.findByUserAndId(user, params?.getLong('product'))
        product?.numberOfProduct = params?.getInt('numberOfProduct')
        product?.description = params?.description
        product?.pursaseForm = quotation
        product?.status = 1
        product?.save(flush: true, failOnError: true)
    }

    def removePurshaseFormProduct(product) {
        product.status = 0
    }

    def savePurhsaseQuatation(params, user) {
        def quotation
        if (params?.getLong('id')) {
            quotation = PurshaseForm?.findByUserAndId(user, params?.getLong('id'))
        } else {
            quotation = new PurshaseForm()
        }
        quotation?.name = params?.name
        quotation?.description = params?.description
        quotation.user = user
        quotation.status = 1
        quotation?.save(failOnError: true, flush: true)

//        def products=params?.list('products')
//        for(product in products){
//            new PurshaseFormProduct(product: Product?.findByUserAndId(user,Long.parseLong(product)),pursaseForm: quotation,price:)
//        }
//        def notificationType=NotificationType.findByType("purshasequotation")
//        for(friend in User.friends(user)){
//            println(friend.id)
//        }
    }

    def submitSalesQuotation(params, user) {
        def quot = SalesForm?.findByUserAndStatusAndId(user, 1, params?.getLong('id'))
        quot.status = 2
        quot.save(flush: true, failOnError: true)
        if (quot) {
            def notificationType = NotificationType?.findByType("purshaceorder")
            new Notification(
                    type: notificationType,
                    formId: params?.id,
                    status: 1,
                    user: quot?.purshaseForm?.user)?.save(flush: true, failOnError: true)
        }
    }

    def saveSalesQuatation(params, user) {
        def quotation
        if (params?.getLong('id')) {
            quotation = SalesForm?.findByUserAndId(user, params?.getLong('id'))
        } else {
            quotation = new SalesForm()
            quotation?.purshaseForm = PurshaseForm?.findByIdAndStatus(params?.getLong('purshaseformid'), 2)
            quotation.user = user
            quotation.tax = params?.getDouble('tax')
            quotation.status = 1
        }
        quotation?.name = params?.name
        quotation?.description = params?.description

        quotation?.save(failOnError: true, flush: true)
        return quotation?.id
    }

    def removeProduct(params, user) {
        def product = Product?.findByIdAndUser(params?.getLong('id'), user)
        product?.status = 0
    }

    def addFriend(params, currentUser) {
        def user2 = User.findByIdAndEnabled(params?.getLong('id'), true)
        def friend = Friend?.findByUser1OrUser2(user2, user2)
        if (!friend) {
            friend = new Friend()
            friend.user1 = currentUser
            friend.user2 = user2
            friend.status = 0
            friend.save(flush: true, failOnError: true)
        } else if (friend.status > 1) {
            friend.status = 0
        }
    }

    def deleteFriend(params, currentUser) {
        def user2 = User.findByIdAndEnabled(params?.getLong('id'), true)
        def friend = Friend?.findByUser1OrUser2(user2, user2)
        friend.status = 2

    }

    def acceptFriendRequest(params, currentuser) {
        def user = User.get(params?.getLong('id'))
        def friend = Friend.findByUser1AndUser2AndStatus(user, currentuser, 0)
        friend.status = 1
        friend.save(flush: true, failOnError: true)
        new Notification(
                type: NotificationType?.findByType("friendrequestaccept"),
                formId: currentuser.id,
                status: 1,
                user: user)?.save(flush: true, failOnError: true)
    }

    def deleteFriendRequest(params, currentuser) {
        def friend = Friend.findByUser1AndUser2AndStatus(User.get(params?.getLong('id')), currentuser, 0)
        friend.status = 2
        friend.save(flush: true, failOnError: true)
    }

    def deleteSalesQuotation(params, user) {
        def quotation = SalesForm.findByUserAndId(user, params?.getLong('id'))
        quotation?.status = 0
    }

    def deletePurshaseQuotation(params, user) {
        def quotation = PurshaseForm.findByUserAndId(user, params?.getLong('id'))
        quotation?.status = 0
    }

    def saveProductToSalesQuotation(params, user) {

        def salesQuotProduct
        if (params?.getLong('id')) {
            salesQuotProduct = SalesFormProduct?.findByIdAndStatus(params?.getLong('id'), 1)
        } else {
            def pq = PurshaseFormProduct?.findByIdAndStatus(params?.getLong('pqid'), 1)
            def salesQuot = SalesForm?.findByPurshaseFormAndUserAndStatus(pq.pursaseForm, user, 1)
            salesQuotProduct = new SalesFormProduct()
            salesQuotProduct?.purhshaseFormProduct = pq
            salesQuotProduct?.submittedByCustomer = false
            salesQuotProduct?.submittedBySeller = false
            salesQuotProduct?.salesForm = salesQuot
            salesQuotProduct?.status = 1
        }
        salesQuotProduct?.price = params?.getDouble('price')
        salesQuotProduct?.discount = params?.getDouble('discount')
        salesQuotProduct?.numberOfProduct = params?.getInt('count')
        salesQuotProduct?.save(flush: true, failOnError: true)

    }

    def deleteSalesQuotProduct(params, user) {
        def quot = SalesFormProduct?.findByIdAndStatus(params?.getLong('id'), 1)
        if (quot?.salesForm?.user == user) {
            quot?.status = 0
        }
    }

    def submitSalesOrder(params, user) {
        def order = SalesForm?.findByIdAndStatusAndUser(params?.getLong('id'), 3, user)
        if (order) {
            order?.status = 4
            order?.deliveryDate = new Date().parse('yyyy-MM-dd', params?.date)
            order?.save(flush: true, failOnError: true)
            new Notification(
                    type: NotificationType?.findByType("tracking"),
                    formId: params?.id,
                    status: 1,
                    user: order?.purshaseForm?.user)?.save(flush: true, failOnError: true)
        }
    }

    def submitdelivery(params) {
        def form = SalesForm.get(params?.getLong('id'))
        form?.status = 5
        form?.save(flush: true, failOnError: true)
        new Notification(
                type: NotificationType?.findByType("delivery"),
                formId: params?.id,
                status: 1,
                user: form?.user)?.save(flush: true, failOnError: true)
    }

    def createInvoice(params) {
        def form = SalesForm.get(params?.getLong('id'))
        form?.status = 6
        form?.save(flush: true, failOnError: true)
        new Notification(
                type: NotificationType?.findByType("invoice"),
                formId: params?.id,
                status: 1,
                user: form?.purshaseForm?.user)?.save(flush: true, failOnError: true)
    }

    def submitInvoice6(params) {
        def invoice = SalesForm?.get(params?.getLong('id'))
        invoice?.status = 7
        new Notification(
                type: NotificationType?.findByType("invoicesubmitted"),
                formId: params?.id,
                status: 1,
                user: invoice?.user)?.save(flush: true, failOnError: true)
    }

    def submitInvoice7(params) {
        def invoice = SalesForm?.get(params?.getLong('id'))
        invoice?.status = 8
        new Notification(
                type: NotificationType?.findByType("invoicesubmitted2"),
                formId: params?.id,
                status: 1,
                user: invoice?.purshaseForm?.user)?.save(flush: true, failOnError: true)
    }

    def saveProfilePicture(params, request) {
        def user = springSecurityService.currentUser
        def files = request.getFiles("image")
        if (files) {
            for (file in files) {
                if (file && !file.empty) {
                    def matcher = (file.getOriginalFilename() =~ /.*\.(.*)$/)
                    def extension
                    if (matcher.matches()) {
                        extension = String?.valueOf(matcher[0][1])?.toLowerCase()
                    }
                    if (extension == 'jpeg' || extension == 'png' || extension == 'bmp' || extension == 'jpg') {
                        String fileName = UUID.randomUUID().toString() + "." + extension
                        String dir = "/home/projects/ada/company/images"
                        def filePath = new File(dir)
                        filePath.mkdirs()
                        file.transferTo(new File(filePath, fileName))
                        CropImage(dir, fileName)
                        user?.image = fileName
                        user?.save(flush: true, failOnError: true)
                    } else {

                    }
                }

            }
        }
    }

    def saveCompanyInfo(params) {
        def company = springSecurityService.currentUser
        company?.description = params?.description
        company?.save(flush: true, failOnError: true)
    }

    def submitComment(params, user) {
        def comment = new Comment()
        comment?.text = params?.comment
        comment.user = user
        comment.salesForm = SalesForm?.get(params?.getLong('id'))
        comment.status = 1
        comment?.save(flush: true,failOnError: true)
    }

    void CropImage(imagePath, imageName) {

        def filePath = imagePath
        def fileName = imageName
        def outputDirImgProfileMiddle = new File(filePath + "/middle")
        outputDirImgProfileMiddle.mkdirs()
        try {
            burningImageService.doWith(filePath + "/" + fileName, outputDirImgProfileMiddle.getAbsolutePath()).execute {
                it.scaleAccurate(500, 500)
            }
        } catch (Exception e) {
            e.printStackTrace();
            throw new Exception(message: "Can't crop image!")
        }


    }

}
