package adastudent

import ada.Friend
import ada.NotificationType
import ada.Product
import ada.PurshaseForm
import ada.SalesForm
import ada.User

class AccountService {
    def springSecurityService

    def saveProduct(params, user) {
        if (params?.id) {
            def product = Product?.findByIdAndUser(params?.getLong('id'), user)
            product?.name = params?.name
            product?.status = 1
        } else {
            new Product(name: params?.name, status: 1, user: user).save(flush: true, failOnError: true)
        }

    }
    def savePurhsaseQuatation(params,user){
        def quotation
        if(params?.getLong('id')){
            quotation=PurshaseForm?.findByUserAndId(user,params?.getLong('id'))
        }else{
            quotation=new PurshaseForm()
        }
        quotation?.name=params?.name
        quotation?.description=params?.description
        quotation.user=user
        quotation.status=1
        quotation?.save(failOnError: true,flush: true)

        def notificationType=NotificationType.findByType("purshasequotation")
        for(friend in User.friends(user)){

        }
    }
    def saveSalesQuatation(params,user){
        def quotation
        if(params?.getLong('id')){
            quotation=SalesForm?.findByUserAndId(user,params?.getLong('id'))
        }else{
            quotation=new SalesForm()
        }
        quotation?.name=params?.name
        quotation?.description=params?.description
        quotation.user=user
        quotation.status=1
        quotation?.save(failOnError: true,flush: true)
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
        } else if (friend.status >1) {
            friend.status = 0
        }
    }
    def acceptFriendRequest(params,currentuser){
        def friend=Friend.findByUser1AndUser2AndStatus(User.get(params?.getLong('id')),currentuser,0)
        friend.status=1
        friend.save(flush: true,failOnError: true)
    }
    def deleteFriendRequest(params,currentuser){
        def friend=Friend.findByUser1AndUser2AndStatus(User.get(params?.getLong('id')),currentuser,0)
        friend.status=2
        friend.save(flush: true,failOnError: true)
    }
    def deleteSalesQuotation(params,user){
    def quotation=SalesForm.findByUserAndId(user,params?.getLong('id'))
        quotation?.status=0
    }
    def deletePurshaseQuotation(params,user){
        def quotation=PurshaseForm.findByUserAndId(user,params?.getLong('id'))
        quotation?.status=0
    }
}
