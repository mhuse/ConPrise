package ada

class SalesForm {
    String name
    Date DateCreated
    int status
    String description
    static belongsTo = [user:User,purshaseForm:PurshaseForm]
    static hasMany = [salesFormProducts:SalesFormProduct]
    boolean submitted //alan teref bunun mehsullarini tesdiq ve satan teref de tesdiq edir , onda 1 olur b
    int trackingStatus //0-created 1-delivered
    double tax
    static constraints = {
    }
    static mapping = {
        version false
    }
}