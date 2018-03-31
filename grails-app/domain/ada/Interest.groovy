package ada

class Interest {
    String name
    static hasMany = [companyInterests:CompanyInterest]
    static constraints = {
    }
    static mapping = {
        version(false)
    }
}
