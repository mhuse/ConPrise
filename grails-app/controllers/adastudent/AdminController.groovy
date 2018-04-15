package adastudent

import ada.Info
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
    def info(){
        [info:Info?.get(1)]
    }
    def saveInfo(){
        adminService.saveInfo(params)
        redirect(action: 'index')
    }
}
