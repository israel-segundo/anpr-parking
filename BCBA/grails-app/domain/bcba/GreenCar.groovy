package bcba
import java.io.File
import jxl.*

class GreenCar {

    static belongsTo = [ carModel: CarModel ]
    int year
    
    Date dateCreated
    Date lastUpdated

    static constraints = {
    }

    static isGreenCar(  ){

    }
	def static uploadCreate(multipartfile){
		// Carga del archivo
		File file = new File('tmp')
		multipartfile.transferTo(file)
		
		Workbook workbook = Workbook.getWorkbook(file)
		Sheet sheet = workbook.getSheet(0)
		def rows = sheet.getRows()
		
		Cell year,maker,model
		
		print rows
		for(i in 2..rows-1){
			model = sheet.getCell(3,i)
			year = sheet.getCell(0,i)
			maker = sheet.getCell(2,i)
			
			if(year.getContents()=='' || model.getContents()==''||maker.getContents()==''){
				break
			}
			//encontrar elementos en la base de datos
			def makerTmp = Maker.findByDescription(maker.getContents())
			def modelTmp = CarModel.findByDescription(model.getContents())

			def yearTmp = 1980	
			if(year.getContents().isInteger()){
				//nos aseguramos que el valor sea entero 
				yearTmp = year.getContents().toInteger()
			}

			//verificar si el modelo es null
			if(modelTmp==null){
				
				//verificar maker existe
				if(makerTmp==null){
					//no existe, se crea
					def newMaker = new Maker(description:maker.getContents())
					newMaker.save()
					makerTmp = newMaker
				}
				
				//Si no existe el modelo se crea
				def newModel = new CarModel(description:model.getContents(),maker:makerTmp)
				newModel.save()
				//Si no existia el modelo se crea automaticamente el auto verde
				def newGreenCar = new GreenCar(year:yearTmp,carModel:newModel)
				newGreenCar.save()		
			}else{
				//verificar si el greenCar tiene el mismo anio
				def tmpGreenCar = GreenCar.findWhere(carModel:modelTmp,year:yearTmp)
				if(tmpGreenCar==null){
					//si no trae nada el anio es diferente, entonces se crea el nuevo auto
					def newGreenCar = new GreenCar(year:yearTmp,carModel:modelTmp)
					newGreenCar.save()
				}
			}
		}
		file.delete()
	}
}
