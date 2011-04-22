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

    }

    /*Accion que se ejecuta al eliminar un fabricante*/
    def delete = {

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

    }
}
