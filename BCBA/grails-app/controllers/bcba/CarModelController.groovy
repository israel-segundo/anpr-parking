package bcba

class CarModelController {

    def index = { 
        [ 'carModels' : CarModel.list() ]
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
        def carModel = CarModel.findById( params.id )

        if( !carModel ){
            flashHelper.info "No se ha encontrado un modelo con id ${params.id}"
            redirect(action:'index')
            return
        }
        [
            'carModel' : carModel,
            'makers' : Maker.list()
        ]
    }

    /*Accion que se ejecuta al activar el formulario de editar*/
    def edit_store = {

    }
}
