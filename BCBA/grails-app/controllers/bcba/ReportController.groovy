package bcba

class ReportController
{
	def index = {
		
	}
	def panel = {
		
	}
	def frequent = {
		//sacar datos del parking record
		//print '\n'
		def frequents = ParkingRecord.executeQuery("select a.plateNumber,count(a.plateNumber) from ParkingRecord a GROUP By a.plateNumber ORDER BY count(a.plateNumber) DESC LIMIT 0,12")
		//print frequents.dump()
		//print 'ya se envio frecuentes'
		[frequents:frequents]
	}
	def bitacora = {
	}
	def comparative = {
		def percentage = Car.executeQuery("select count(c.discount) from Car c GROUP BY c.discount")
		[percentage:percentage]
	}
	def resume = {
		[texto:'asdasdasdas']
	}
}