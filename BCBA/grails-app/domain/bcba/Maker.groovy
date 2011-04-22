package bcba

class Maker {

    static hasMany = [ carModels : CarModel ]
    String description

    Date dateCreated
    Date lastUpdated
    
    static constraints = {
    }
}
