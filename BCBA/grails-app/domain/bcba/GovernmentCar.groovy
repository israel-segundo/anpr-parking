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
		
		Cell year,make,model,discount,plate
		
		print 'El numero de filas es : '+rows
		print '---------------------------------------'
		for (i in 0..rows-1){
			year = sheet.getCell(0,i)
			make = sheet.getCell(1,i)
			model = sheet.getCell(2,i)
			discount = sheet.getCell(3,i)
			plate = sheet.getCell(4,i)
			
			print 'año : '+year.getContents()+',creador: '+make.getContents()+',modelo: '+model.getContents()+',descuento: '+discount.getContents()+',placa: '+plate.getContents()+'\n'
		}
		print '---------------------------------------'	
		file.delete()	
	}
}
