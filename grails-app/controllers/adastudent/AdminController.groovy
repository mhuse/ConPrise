package adastudent

import ada.User
import grails.plugins.springsecurity.Secured

@Secured(["ROLE_ADMIN"])

class AdminController {
def adminService
    def index() {
        def companies=User?.findAllByEnabled(true)
        [companies:companies]
    }
    def submitVoen(){
         adminService.submitVoen(params?.getLong('id'))
        redirect(action: 'index')
    }
}
