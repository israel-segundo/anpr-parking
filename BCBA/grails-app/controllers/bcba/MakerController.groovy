package bcba

import grails.converters.*

class MakerController {

    def index = {
        ['makers' : Maker.list()]
    }

    /*Accion que se ejecuta antes de mostrar el formulario de agregar*/
    def add = {
        []
    }

    /*Accion que se ejecuta al activar el formulario de agregar*/
    def add_store = {
        def fdescripcion = params.description

        def maker = new Maker( description: fdescripcion)

        if( maker.save() ){
            flashHelper.info 'Se ha almacenado el registro exitosamente'
        }else{
            flashHelper.error "Hubo un error al almacenar el registro. ${maker.errors}"
        }
        redirect(action:'index')
    }

    /*Accion que se ejecuta al eliminar un fabricante*/
    def delete = {

        def maker = Maker.get( params.id )

        try{
            maker.delete()
            flashHelper.info "Se ha eliminado al fabricante con id ${params.id}"

        }catch(org.springframework.dao.DataIntegrityViolationException e) {
            flashHelper.error "No se ha podido eliminar al fabricante con id ${params.id}"
        }
        redirect(action:'index')
    }

    /*Acción que se ejecuta antes de mostrar el formulario de editar*/
    def edit = {
        def maker = Maker.findById( params.id )

        if( !maker ){
            flashHelper.info "No se ha encontrado un fabricante con id ${params.id}"
            redirect(action:'index')
            return
        }
        [ 'maker' : maker ]
    }

    /*Accion que se ejecuta al activar el formulario de editar*/
    def edit_store = {

        def maker = Maker.get( Integer.parseInt(params.id) )

        if(!maker){
            flashHelper.info 'No se puede editar un fabricante inexistente'
        }else{

            maker.description = params.description

            if( maker.save(inser:false) ){
                flashHelper.info 'Se ha actualizado el registro exitosamente'
            }else{
                flashHelper.error "Hubo un error al actualizar el registro. ${maker.errors}"
            }
        }
        redirect(action:'index')
    }

    /*Accion que sirve a peticiones ajax*/
    def getCarModels = {
        def maker = Maker.get( params.id )
        def converter = maker?.carModels as JSON

	render params.callback + "('" + converter.toString() + "')"
    }
}
