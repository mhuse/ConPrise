package adastudent

import ada.User

class AdminService {

  def submitVoen(id){
      def user=User?.get(id)
      user?.voenSubmitted=true
      user.save(flush: true,failOnError: true)
  }
}
