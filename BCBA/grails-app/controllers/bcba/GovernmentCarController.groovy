package bcba

class GovernmentCarController {

    def index = {
        [ 'governmentCars': GovernmentCar.list() ]
    }

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

    def edit = {

        def gCar = GovernmentCar.findById( params.id )

        if( !gCar ){
            flashHelper.info "No se ha encontrado un auto de gobierno con id ${params.id}"
            redirect(action:'index')
            return
        }
        [
            'gCar' : gCar,
            'makers' : Maker.list()
        ]
    }

    def edit_store = {

        def gCar = GovernmentCar.get( Integer.parseInt(params.id) )

        if( !gCar ){
            flashHelper.info 'No se puede editar un auto de gobierno inexistente'
        }else{

            gCar.carModel    = CarModel.get(params.carModel)
            gCar.year        = Integer.parseInt(params.year)
            gCar.plateNumber = params.plateNumber

            if( gCar.save( insert:false ) ){
                flashHelper.info 'Se ha actualizado el registro exitosamente'
            }else{
                flashHelper.error "Hubo un error al actualizar el registro. ${gCar.errors}"
            }
        }
        redirect(action:'index')
    }

    def delete = {
        
        def gCar = GovernmentCar.get(params.id)

        try{
            gCar.delete()
            flashHelper.info "Se ha eliminado al auto de gobierno con id ${params.id}"
        }
        catch(org.springframework.dao.DataIntegrityViolationException e) {
            flashHelper.error "No se ha podido eliminar al auto de gobierno con id ${params.id}"
        }

        redirect( action: 'index')
    }

    def upload_file = {
        
    }

    def upload_store = {

        def f = request.getFile('file')

        if( !f.empty ){

            // Carga del archivo

            flashHelper.info "Se ha cargado el archivo existosamente."
            redirect( action: 'index' )

        }else{
            flashHelper.error "Error al cargar el archivo. Intente nuevamente."
            redirect( action: 'upload_file' )
        }
    }
}
