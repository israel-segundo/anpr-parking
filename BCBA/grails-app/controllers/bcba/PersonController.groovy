package bcba

class PersonController {

    def index = {
        [ 'persons' : Person.list() ]
    }

    /*Accion que se ejecuta antes de mostrar el formulario de agregar*/
    def add = {
        []
    }

    /*Accion que se ejecuta al activar el formulario de agregar*/
    def add_store = {

        def fname        = params.name
        def flastName    = params.lastName
        def femail       = params.email

        def person = new Person( name: fname, lastName: flastName, email:femail )

        if( person.save() ){
            flashHelper.info 'Se ha almacenado el registro exitosamente'
        }else{
            flashHelper.error "Hubo un error al almacenar el registro. ${person.errors}"
        }
        redirect(action:'index')
    }

    /*Accion que se ejecuta al eliminar un fabricante*/
    def delete = {
        
        def person = Person.get(params.id)

        try{
            person.delete( flush:true)
            flashHelper.info "Se ha eliminado a la persona con id ${params.id}"
        }
        catch(org.springframework.dao.DataIntegrityViolationException e) {
            flashHelper.error "No se ha podido eliminar a la persona con id ${params.id}"
        }

        redirect( action: 'index')
    }

    /*Acción que se ejecuta antes de mostrar el formulario de editar*/
    def edit = {
        def person = Person.findById( params.id )

        if( !person ){
            flashHelper.info "No se ha encontrado una persona con id ${params.id}"
            redirect(action:'index')
            return
        }

        ['person':person]
    }

    /*Accion que se ejecuta al activar el formulario de editar*/
    def edit_store = {

        def person = Person.get( Integer.parseInt(params.id) )

        if( !person ){
            flashHelper.info 'No se puede editar una persona inexistente'
        }else{

            person.name     = params.name
            person.lastName = params.lastName
            person.email    = params.email

            if( person.save( insert:false ) ){
                flashHelper.info 'Se ha actualizado el registro exitosamente'
            }else{
                flashHelper.error "Hubo un error al actualizar el registro. ${person.errors}"
            }
        }
        redirect(action:'index')
    }
}
