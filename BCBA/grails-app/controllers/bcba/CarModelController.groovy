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

        def fmaker       = params.maker
        def fdescription = params.description

        def maker = Maker.get( fmaker )

        def carModel         = new CarModel()
        carModel.maker       = maker
        carModel.description = fdescription

        if( carModel.save() ){
            flashHelper.info 'Se ha almacenado el registro exitosamente'
        }else{
            flashHelper.error "Hubo un error al almacenar el registro. ${carModel.errors}"
        }

        redirect(action:'index')
    }

    /*Accion que se ejecuta al eliminar un fabricante*/
    def delete = {

        def carModel = CarModel.get(params.id)

        try{
            carModel.delete( flush:true)
            flashHelper.info "Se ha eliminado el modelo con id ${carModel.id}"
        }
        catch(org.springframework.dao.DataIntegrityViolationException e) {
            flashHelper.error "No se ha podido eliminar el modelo con id ${params.id}"
        }
        redirect( action: 'index')
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

        def carModel = CarModel.get( Integer.parseInt(params.id) )

        if( !carModel ){
            flashHelper.info 'No se puede editar un modelo inexistente'
        }else{

            carModel.maker        = Maker.get(params.maker)
            carModel.description = params.description

            if( carModel.save( insert:false ) ){
                flashHelper.info 'Se ha actualizado el registro exitosamente'
            }else{
                flashHelper.error "Hubo un error al actualizar el registro. ${carModel.errors}"
            }
        }
        redirect(action:'index')
    }
}
