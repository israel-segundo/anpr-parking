package bcba

class Person {

    static hasMany = [ cars: Car ]
    String name
    String lastName
    String email
    
    Date dateCreated
    Date lastUpdated

    static constraints = {

    }
}
