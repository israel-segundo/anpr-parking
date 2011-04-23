package bcba

class GreenCarController {

    def index = {
        [ 'greenCars' : GreenCar.list() ]
    }

    /*Accion que se ejecuta antes de mostrar el formulario de agregar*/
    def add = {
        [ 'makers' : Maker.list() ]
    }

    /*Accion que se ejecuta al activar el formulario de agregar*/
    def add_store = {

        //def maker     = params.maker
        def carModel  = CarModel.get(params.carModel)
        def year      = params.year

        def greenCar = new GreenCar(
            carModel: carModel,
            year: year
        )

        if( greenCar.save() ){
            flashHelper.info 'Se ha almacenado el registro exitosamente'
        }else{
            flashHelper.error "Hubo un error al almacenar el registro. ${greenCar.errors}"
        }
        redirect(action:'index')
    }

    /*Accion que se ejecuta al eliminar un fabricante*/
    def delete = {

        def greenCar = GreenCar.get(params.id)

        try{
            greenCar.delete()
            flashHelper.info "Se ha eliminado al green car con id ${params.id}"
        }
        catch(org.springframework.dao.DataIntegrityViolationException e) {
            flashHelper.error "No se ha podido eliminar al green car con id ${params.id}"
        }

        redirect( action: 'index')
    }

    /*Acción que se ejecuta antes de mostrar el formulario de editar*/
    def edit = {
        def greenCar = GreenCar.findById( params.id )

        if( !greenCar ){
            flashHelper.info "No se ha encontrado un green car con id ${params.id}"
            redirect(action:'index')
            return
        }
        [
            'greenCar' : greenCar,
            'makers' : Maker.list()
        ]
    }

    /*Accion que se ejecuta al activar el formulario de editar*/
    def edit_store = {

        def greenCar = GreenCar.get( Integer.parseInt(params.id) )

        if( !greenCar ){
            flashHelper.info 'No se puede editar un green car inexistente'
        }else{

            greenCar.carModel  = CarModel.get(params.carModel)
            greenCar.year      = Integer.parseInt(params.year)

            if( greenCar.save( insert:false ) ){
                flashHelper.info 'Se ha actualizado el registro exitosamente'
            }else{
                flashHelper.error "Hubo un error al actualizar el registro. ${person.errors}"
            }
        }
        redirect(action:'index')
    }
}
