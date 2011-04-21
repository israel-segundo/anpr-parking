package bcba

class CarController {


    def allowedMethods = [add:'POST']

    def add = {

        def car = new Car([ 
                year       : Integer.parseInt(params.year),
                color      : params.color,
                discount   : params.discount,
                plateNumber: params.plateNumber
            ])
            
        car.save()
    }
}
