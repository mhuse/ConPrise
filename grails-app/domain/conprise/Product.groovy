package conprise

class Product {
    String name
    Date DateCreated
    int status
    String image
    static belongsTo = [user:User,category:Category]
    static constraints = {
        image nullable: true,blank: true
    }
    static mapping = {
        version false
    }
}
