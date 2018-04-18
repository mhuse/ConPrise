package conprise

class PurshaseForm {
    static belongsTo = [user:User]
    String name
    String description
    Date DateCreated
    int status //0-DELETED, 1-ACTIVE, 2-SUBMITTED
    static hasMany = [products:PurshaseFormProduct]
    static constraints = {
        name nullable: true,blank: true
        description nullable: true,blank: true
    }
    static mapping = {
        version false
    }
}
