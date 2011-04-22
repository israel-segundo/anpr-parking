package bcba

class Car {

    static belongsTo = [ carModel: CarModel, person: Person ]

    int year
    boolean discount
    String color
    String plateNumber

    Date dateCreated
    Date lastUpdated
    
    static constraints = {
    }
}
