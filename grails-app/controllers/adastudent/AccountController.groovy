package adastudent

import ada.Friend
import ada.Notification
import ada.NotificationType
import ada.Product
import ada.PurshaseForm
import ada.SalesForm
import ada.User
import grails.plugins.springsecurity.Secured

@Secured(["ROLE_COMPANY"])
class AccountController {
    def accountService
    def springSecurityService

    def index() {}

    def search() {
        def companies = User?.findAllByVoenLikeOrNameLikeOrUsernameLikeOrDescriptionLike('%' + params?.q + '%', '%' + params?.q + '%', '%' + params?.q + '%', '%' + params?.q + '%', [enabled: true])
        companies.remove(springSecurityService.currentUser)
        [foundcompanies: companies, currentUser: springSecurityService.currentUser]
    }

    def addPurshaseQuotation() {
        def quotation
        if (params?.getLong('id')) {
            quotation = PurshaseForm.findByIdAndUserAndStatus(params?.getLong('id'), springSecurityService.currentUser, 1)
        }
        [quotation: quotation]
    }

    def purshaceQuatationList() {
        def quotations = PurshaseForm.findAllByUserAndStatus(springSecurityService.currentUser, 1)
        [quotations: quotations]
    }

    def salesQuatationList() {
        def quotations = SalesForm.findAllByUserAndStatus(springSecurityService.currentUser, 1)
        [quotations: quotations]
    }

    def savePurhsaseQuatation() {
        accountService.savePurhsaseQuatation(params, springSecurityService.currentUser)
        redirect(action: 'purshaceQuatationList')
    }

    def saveSalesQuatation() {
        accountService.saveSalesQuatation(params, springSecurityService.currentUser)
        redirect(action: 'purshaceQuatationList')
    }

    def addSalesQuotation() {
        def quotation
        if (params?.getLong('id')) {
            quotation = SalesForm.findByIdAndUserAndStatus(params?.getLong('id'), springSecurityService.currentUser, 1)
        }
        [quotation: quotation]
    }

    def addFriend() {
        accountService.addFriend(params, springSecurityService.currentUser)
        redirect(action: 'search', params: [q: params?.q])
    }

    def addProduct() {
        if (params?.getLong('id')) {
            [product: Product?.findByIdAndUser(params?.getLong('id'), springSecurityService.currentUser)]
        }
    }

    def removeProduct() {
        accountService.removeProduct(params, springSecurityService.currentUser)
        redirect(action: 'productList')
    }

    def productList() {
        def products = Product?.findAllByUserAndStatus(springSecurityService.currentUser, 1)
        [products: products]
    }

    def saveProduct() {
        accountService.saveProduct(params, springSecurityService.currentUser)
        redirect(action: 'productList')
    }

    def leftNav() {
        def productCount = Product?.countByUserAndStatus(springSecurityService.currentUser, 1)
        def friendRequest = Friend.countByUser2AndStatus(springSecurityService.currentUser, 0)
        def notificationCount = Notification?.countByUserAndStatus(springSecurityService.currentUser, 1)
        [productCount: productCount, notificationCount: notificationCount, friendRequest: friendRequest]
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
        redirect(action: 'friendRequests')
    }

    def deletePurshaseQuotation() {
        accountService.deletePurshaseQuotation(params, springSecurityService.currentUser)
        redirect(action: 'purshaceQuatationList')
    }

    def deleteSalesQuotation() {
        accountService.deleteSalesQuotation(params, springSecurityService.currentUser)
        redirect(action: 'purshaceQuatationList')
    }

    def trigger() {
        new NotificationType(text: "sizə dostluq təklifi göndərdi !", type: "friendRequest").save(flush: true, failOnError: true)
//        new NotificationType(text: 'şirkəti yeni alış sənədi yaratdı !',type:'friendRequest').save(flush: true,failOnError: true)
//        new NotificationType(text: 'şirkəti sizin məhsul üçün satış sənədi yaratdı !').save(flush: true,failOnError: true)
//        new NotificationType(text: 'şirkəti sizə satış üçün razılaşma göndərdi !').save(flush: true,failOnError: true)
//        new NotificationType(text: 'Yeni razılaşmanı qəbul etmək üçün daxil olun.').save(flush: true,failOnError: true)
    }
}
