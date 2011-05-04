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
	def static uploadCreate(multipartfile){
		
		File file = new File('gov')
		multipartfile.transferTo(file)
		
		Workbook workbook = Workbook.getWorkbook(file)
		Sheet sheet = workbook.getSheet(0)
		def rows = sheet.getRows()
		
		Cell year,maker,model,discount,plate
		
		print 'El numero de filas es : '+rows
		print '---------------------------------------\n'
		for (i in 1..rows-1){
			year = sheet.getCell(0,i)
			maker = sheet.getCell(1,i)
			model = sheet.getCell(2,i)
			discount = sheet.getCell(3,i)
			plate = sheet.getCell(4,i)
			
			def tmpGovCar = GovernmentCar.findByPlateNumber(plate.getContents())
			print tmpGovCar
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
		print '---------------------------------------'	
		file.delete()	
	}
}
