package ada

class SalesForm {
    String name
    Date DateCreated
    int status //0-deleted 1-created 2-submitted(quotation) //3-approved by selling company
    //4-tracking created //5-delivery submitted by buying company
    //6-invoice created //7-invoice submitted by buying company
    //8-invoice submitted by selling company
    String description
    static belongsTo = [user:User,purshaseForm:PurshaseForm]
    static hasMany = [salesFormProducts:SalesFormProduct,comments:Comment]
    boolean submitted //alan teref bunun mehsullarini tesdiq ve satan teref de tesdiq edir , onda 1 olur b
    double tax
    Date deliveryDate
    static constraints = {
        deliveryDate nullable: true,blank:true
    }
    static mapping = {
        version false
    }
}