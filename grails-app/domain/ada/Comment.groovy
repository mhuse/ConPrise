package ada

class Comment {
    static belongsTo = [user:User,salesForm:SalesForm]
    String text
    Date dateCreated
    int status
    static constraints = {
    }
    static mapping = {
        version false
        text type: 'text'
    }
}
