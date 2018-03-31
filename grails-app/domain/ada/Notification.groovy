package ada

class Notification {
    int status //0-oxunmush //1-oxunmamish
    static belongsTo = [user:User,type:NotificationType]
    int formId
    Date dateCreated
    static constraints = {
    }
    static mapping = {
        version false
    }
}
