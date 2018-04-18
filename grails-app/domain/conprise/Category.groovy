package conprise

class Category {
    String name
    int status
    static hasMany = [products:Product]
    static constraints = {
    }
    static mapping = {
        version(false)
    }
}
