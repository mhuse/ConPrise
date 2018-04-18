package conprise

class Friend {
    User user1 //user1- dostluq gonderen , user2-dostluqu qebul eden ( Bele de ki ferqi yoxdu ;) )
    User user2
    Date dateCreated
    int status //0- qebul edilmeyib , 1- qebul edilib , 2- reject edilib ve ya silinib
    static constraints = {
    }
    static mapping = {
        version false
    }
}
