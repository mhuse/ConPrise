package ada

class User {

	transient springSecurityService
	String username
	String password
	String name
	String voen
	String activated   //1 or token
	Date creationDate
	String description
	String address
	Date dateCreated
	String image
	boolean enabled
	boolean firstLogin
	boolean voenSubmitted
	boolean accountExpired
	boolean accountLocked
	boolean passwordExpired
	static hasMany = [products:Product,companyInterest:CompanyInterest,comments:Comment]
	static constraints = {
		username blank: false, unique: true
		password blank: false
		creationDate nullable: true,blank: true
		description nullable: true,blank: true
		address nullable: true,blank: true
		voenSubmitted nullable: true,blank: true
		image nullable: true,blank: true
	}

//	def friends(user){
//		return Friend.findAllByUser1AndStatus(user,1).user2+Friend.findAllByUser2AndStatus(user,1).user1
//
//	}
	static mapping = {
		password column: '`password`'
		description type: 'text'
	}
	Set<Role> getAuthorities() {
		UserRole.findAllByUser(this).collect { it.role } as Set
	}

	def beforeInsert() {
		encodePassword()
	}

	def beforeUpdate() {
		if (isDirty('password')) {
			encodePassword()
		}
	}

	protected void encodePassword() {
		password = springSecurityService.encodePassword(password)
	}
}
