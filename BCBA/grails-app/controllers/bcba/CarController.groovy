package bcba

class CarController {

    def add = {
        [
            'person': Person.get(params.id),
            'makers': Maker.list()
        ]
    }

    def add_store = {

        def person = Person.get( params.personId )
        
        if( !person ){
            flashHelper.error "Hubo un error al almacenar el registro. Intente nuevamente"
            redirect( controller: 'person', action: 'index')
        }else{

            def carModel    = CarModel.get( params.carModel )
            def year        = params.year
            def plateNumber = params.plateNumber

            def car = new Car( 
                person: person,
                carModel: carModel,
                year: year,
                plateNumber : plateNumber
            )
            
            if( car.save() ){
                flashHelper.info 'Se ha almacenado el registro exitosamente'
            }else{
                flashHelper.error "Hubo un error al almacenar el registro. ${car.errors}"
            }

            redirect(controller: 'person',action:'edit', id:person.id)
        }
    }

    def delete = {

        def car = Car.get(params.id)
        def person = car.person

        try{
            car.delete()
            flashHelper.info "Se ha eliminado al auto con id ${params.id}"
        }
        catch(org.springframework.dao.DataIntegrityViolationException e) {
            flashHelper.error "No se ha podido eliminar al auto con id ${params.id}"
        }

        redirect(controller: 'person',action:'edit', id: person.id)
    }

    def edit = {

        def car = Car.get( params.id )

        if( !car ){
            flashHelper.info "No se ha encontrado un auto con id ${params.id}"
            redirect(controller: 'person', action:'index')
            return
        }
        [
            'car' : car,
            'makers' : Maker.list()
        ]
    }

    def edit_store = {

        def car = Car.get( Integer.parseInt(params.id) )

        if( !car ){
            flashHelper.info 'No se puede editar un green car inexistente'
            redirect( controller: 'person', action: 'index')
        }else{

            def person = car.person
            car.carModel  = CarModel.get(params.carModel)
            car.year      = Integer.parseInt(params.year)
            car.plateNumber = params.plateNumber
			
			/*To fix the goddamn grails error ¬¬'*/
			car.discount = GovernmentCar.isGreenCar(car.plateNumber)
			
            if( car.save( insert:false ) ){
                flashHelper.info 'Se ha actualizado el registro exitosamente'
            }else{
                flashHelper.error "Hubo un error al actualizar el registro. ${car.errors}"
            }
            redirect(controller: 'person',action:'edit', id:person.id)
        }

    }
}