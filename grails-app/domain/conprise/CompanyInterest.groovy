package conprise

class CompanyInterest {
    static belongsTo = [user:User]
    Interest interest
    int status
    static constraints = {
    }
}
