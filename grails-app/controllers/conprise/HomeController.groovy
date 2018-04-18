package conprise

class HomeController {
    def homeService

    def index() {
        redirect(controller: 'account')
    }

    def signup() {
            redirect(controller: 'login', action: 'auth', params: [message: homeService.signup(params)])
    }
    def activateAccount(){
            redirect(controller: 'login',params: [message:homeService?.activateAccount(params)])
    }

    def adminGenerator(){
            def admin = new User()
            admin?.name = 'ADA'
            admin?.username = 'admin'
            admin?.voen = '1'
            admin?.password = '00000000'
            admin?.enabled = true
            admin?.accountExpired = false
            admin?.accountLocked = false
            admin?.passwordExpired = false
            admin?.activated = '1'
            admin?.save(flush: true, failOnError: true)
            def roleAdmin = new Role(authority: 'ROLE_ADMIN')?.save(flush: true,failOnError: true)
            def roleCompany = new Role(authority: 'ROLE_COMPANY')?.save(flush: true,failOnError: true)
            new UserRole(user: admin,role: roleAdmin)?.save(flush: true,failOnError: true)
    }
}
