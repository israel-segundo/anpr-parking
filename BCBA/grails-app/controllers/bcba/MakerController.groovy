package bcba

import grails.converters.*

class MakerController {

    def index = {

        [
            'makers' : Maker.list()
        ]
    }

    /*Accion que se ejecuta antes de mostrar el formulario de agregar*/
    def add = {
        //flashHelper.info "Some Message"
        []
    }

    /*Accion que se ejecuta al activar el formulario de agregar*/
    def add_store = {

    }

    /*Accion que se ejecuta al eliminar un fabricante*/
    def delete = {

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

    }

    def getCarModels = {
        def maker = Maker.get( params.id )
        def converter = maker?.carModels as JSON

	render params.callback + "('" + converter.toString() + "')"
    }
}
