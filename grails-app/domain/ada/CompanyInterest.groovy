package ada

class CompanyInterest {
    static belongsTo = [user:User]
    Interest interest
    int status
    static constraints = {
    }
}
