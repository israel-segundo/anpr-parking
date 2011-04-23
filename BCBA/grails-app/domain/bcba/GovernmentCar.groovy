package bcba

class GovernmentCar {

    static belongsTo = [ carModel: CarModel]

    int year
    boolean discount
    String plateNumber

    Date dateCreated
    Date lastUpdated

    static constraints = {
    }
}
