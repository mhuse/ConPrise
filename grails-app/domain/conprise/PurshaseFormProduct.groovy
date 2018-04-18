package conprise

class PurshaseFormProduct {
    //price will be inserted after first user submit sales form product.
    static belongsTo = [product: Product, pursaseForm: PurshaseForm]
    double price
    String description
    double numberOfProduct
    int status // default 1 , silindi 0, tesdiq edildi 2 , yoldadir 3 , chatdi 4
    static hasMany = [comments:Comment]
    static constraints = {
        price nullable:true,blank:true
    }
    static mapping = {
        version false
    }
}
