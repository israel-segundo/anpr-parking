package bcba
import java.io.File
import jxl.*

class GovernmentCar {

    static belongsTo = [ carModel: CarModel]

    int year
    boolean discount
    String plateNumber

    Date dateCreated
    Date lastUpdated

    static constraints = {
    }
	/*
	Funcion que recibe el string de la placa y devuelve si es green o no 
	*/
	def static boolean isGreenCar(plateNumber){
		//obtener el governmentCar con la placa
		
		def governmentCar = GovernmentCar.findByPlateNumber(plateNumber)
		
		if(governmentCar == null){
			return false
		}else{
			//revisar que el carro de gobierno  asdas
			def model = CarModel.get(governmentCar.carModel.id)
			//si el modelo existe verifiquemos el año
			if(model!=null){
				def greenCars = model.greenCars
				//print greenCars
				//verificar el anio dentro de la lista de carros verdes obtenidos
				for(car in greenCars){
					//print car.dump()
					//print '\n'
					if(car.year == governmentCar.year)
					{
						return true
					}
				}
			}
			return false
		}
	}
	/*
	Funcion que recibe un Spring multipartFile Upload
	y accede al excel para poder hacer updates sobre la base de datos
	*/
	def static uploadCreate(multipartfile){
		
		File file = new File('gov')
		multipartfile.transferTo(file)
		
		Workbook workbook = Workbook.getWorkbook(file)
		Sheet sheet = workbook.getSheet(0)
		def rows = sheet.getRows()
		
		Cell year,maker,model,discount,plate
		
		for (i in 1..rows-1){
			year = sheet.getCell(0,i)
			maker = sheet.getCell(1,i)
			model = sheet.getCell(2,i)
			discount = sheet.getCell(3,i)
			plate = sheet.getCell(4,i)
			
			def tmpGovCar = GovernmentCar.findByPlateNumber(plate.getContents())
			//verificar que el year sea válido
			def yearTmp = 1980
			if(year.getContents().isInteger()){

				//De ser asi se obtiene el year
				yearTmp = year.getContents().toInteger()
			}
			
			if(tmpGovCar == null){
				//si no esta hay que crearlo
				//verificar el modelo 
				
				def tmpMaker = Maker.findByDescription(maker.getContents())
				def tmpModel = CarModel.findByDescription(model.getContents())
								
				if(tmpModel == null){
					if(tmpMaker == null){
						def newMaker = new Maker(description:maker.getContents())
						newMaker.save()
						tmpMaker = newMaker
					}

					def newModel = new CarModel(description:model.getContents(),maker:tmpMaker)
					newModel.save()
					tmpModel = newModel
					def newGovCar = new GovernmentCar(year:yearTmp,carModel:tmpModel,discount:false,plateNumber:plate.getContents())
					newGovCar.save()
				}else{
					def newGovCar = new GovernmentCar(year:yearTmp,carModel:tmpModel,discount:false,plateNumber:plate.getContents())
					newGovCar.save()
				}
				
				print 'año : '+year.getContents()+',creador: '+maker.getContents()+',modelo: '+model.getContents()+',descuento: '+discount.getContents()+',placa: '+plate.getContents()+'\n'				
			}
		}	
		file.delete()	
	}
}
