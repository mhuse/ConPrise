package conprise

class AdminService {

  def submitVoen(id){
      def user=User?.get(id)
      user?.voenSubmitted=true
      user.save(flush: true,failOnError: true)
  }
    def saveInfo(params){
        def info=Info.get(1)
        info?.title=params?.title
        info?.text=params?.text
        info?.save(flush: true,failOnError: true)
    }
}
