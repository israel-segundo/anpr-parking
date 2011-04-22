package bcba

class CarModel {

    static belongsTo = [ maker: Maker ]
    static hasMany   = [ cars : Car, greenCars : GreenCar ]
    String description

    Date dateCreated
    Date lastUpdated

    static constraints = {
    }
}
