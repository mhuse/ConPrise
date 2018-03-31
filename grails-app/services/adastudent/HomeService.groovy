package adastudent

import ada.CompanyInterest
import ada.Interest
import ada.Role
import ada.User
import ada.UserRole

class HomeService {
def mailService
    def signup(params){
        if(!User.findByUsername(params?.username)){
            def user=new User()
            user.name=params?.name
            user.username=params?.username
            user.voen=params?.voen
            user.password=params?.password
            user.enabled=false
            user.accountExpired=false
            user.accountLocked=false
            user.voenSubmitted=false
            user.passwordExpired=false
            user.firstLogin=false
            user.activated=UUID.randomUUID().toString()
            user.save(flush: true,failOnError: true)
            new UserRole(user: user,role: Role.findByAuthority('ROLE_COMPANY'))?.save(flush: true,failOnError: true)

            def interests=params?.list('interest')
            for(interest in interests){
                def intrst=Interest?.get(Long.parseLong(interest))
                new CompanyInterest(user: user,interest:intrst)?.save(flush: true,failOnError: true)
            }
            mailService.sendMail {
                to user?.username
                from "ADA <info@texnologiya.az>"
                subject "Hesab Aktivləşdirilməsi"
                html "<a href='http://13.90.84.149/ada/home/activateAccount?token=${user?.activated}' style=\"\t-moz-box-shadow: 0px 0px 0px 2px #9fb4f2;\n" +
                        "-webkit-box-shadow: 0px 0px 0px 2px #9fb4f2;\n" +
                        "box-shadow: 0px 0px 0px 2px #9fb4f2;\n" +
                        "background:-webkit-gradient(linear, left top, left bottom, color-stop(0.05, #7892c2), color-stop(1, #476e9e));\n" +
                        "background:-moz-linear-gradient(top, #7892c2 5%, #476e9e 100%);\n" +
                        "background:-webkit-linear-gradient(top, #7892c2 5%, #476e9e 100%);\n" +
                        "background:-o-linear-gradient(top, #7892c2 5%, #476e9e 100%);\n" +
                        "background:-ms-linear-gradient(top, #7892c2 5%, #476e9e 100%);\n" +
                        "background:linear-gradient(to bottom, #7892c2 5%, #476e9e 100%);\n" +
                        "filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#7892c2', endColorstr='#476e9e',GradientType=0);\n" +
                        "background-color:#7892c2;\n" +
                        "-moz-border-radius:10px;\n" +
                        "-webkit-border-radius:10px;\n" +
                        "border-radius:10px;\n" +
                        "border:1px solid #4e6096;\n" +
                        "display:inline-block;\n" +
                        "cursor:pointer;\n" +
                        "color:#ffffff;\n" +
                        "font-family:Arial;\n" +
                        "font-size:19px;\n" +
                        "padding:12px 37px;\n" +
                        "text-decoration:none;\n" +
                        "text-shadow:0px 1px 0px #283966;\">Hesabınızı ativləşdirin </a>"
            }
            return "Account created !  Go to your email address and submit your account ."
        }else{
            return "This username already registered ! Please, select another one ."
        }
    }
    def activateAccount(params){
        def user=User.findByActivated(params?.token)
                if(user){
                    user.activated='1'
                    user.enabled=true
                    return 'Account Activated !'
                }else{
                    return 'There is no user that has been registered with this token !'
                }
    }
}
