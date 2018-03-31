package ada

class SalesFormProduct {
    static belongsTo = [purhshaseFormProduct:PurshaseFormProduct, salesForm:SalesForm]
    int status //0-deleted 1-active 2-approved by buying companu  //3-e ehtiyac yoxdur . Selling company tracking yaradanda
    // artiq status sales form uzerinde deyishir . Productun status deyishmesine ehtiyac yoxdur .
    Date dateCreated
    boolean submittedByCustomer
    boolean submittedBySeller
    double discount
    double price
    double numberOfProduct
    static constraints = {
        discount nullable:true,blank:true
    }
    static mapping = {
        version false
    }
}
