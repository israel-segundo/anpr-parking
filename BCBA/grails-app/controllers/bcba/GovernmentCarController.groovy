package bcba

class GovernmentCarController {

    def add = {
        [ 'makers': Maker.list() ]
    }

    def add_store = {

        def carModel    = CarModel.get(params.carModel)
        def year        = params.year
        def plateNumber = params.plateNumber

        def governmentCar = new GovernmentCar(
            carModel: carModel,
            year: year,
            plateNumber : plateNumber
        )

        if( governmentCar.save() ){
            flashHelper.info 'Se ha almacenado el registro exitosamente'
        }else{
            flashHelper.error "Hubo un error al almacenar el registro. ${governmentCar.errors}"
        }
        redirect(action:'add')
    }
}
