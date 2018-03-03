package ada

class Notification {
    int status //0-oxunmush //1-oxunmamish
    static belongsTo = [user:User,type:NotificationType]
    String formType   //0 -
    int formId
    static constraints = {
    }
    static mapping = {
        version false
    }
}
