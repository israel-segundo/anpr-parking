package bcba

class GreenCar {

    static belongsTo = [ carModel: CarModel ]
    int year
    
    Date dateCreated
    Date lastUpdated

    static constraints = {
    }

    static isGreenCar(  ){

    }
}
