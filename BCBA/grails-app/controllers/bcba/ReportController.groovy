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
		print '\n'
		//def carPerDay = ParkingRecord.executeQuery("select a.plateNumber,count(a.plateNumber) from ParkingRecord a where MONTH(a.entranceDate) =MONTH(CURDATE()) AND YEAR(a.entranceDate)=YEAR(CURDATE())GROUP BY a.plateNumber")
		//def carPerDay = ParkingRecord.executeQuery("select a.plateNumber,count(a.plateNumber) from ParkingRecord a where MONTH(a.entranceDate) >= 0 GROUP BY a.plateNumber")
		def carPerDay = []
		def daysInMont = [31,28,31,30,31,30,31,31,30,31,30,31]
		def currentMonth = new Date().getMonth()
		def days = daysInMont[currentMonth]
		for (i in 1..days ){
			carPerDay[i] = ParkingRecord.executeQuery("select count(a.plateNumber) from ParkingRecord a where MONTH(a.entranceDate) =MONTH(CURDATE()) AND YEAR(a.entranceDate)=YEAR(CURDATE()) AND DAY(a.entranceDate)=?",i)[0]
			print 'Puta madre!!\n'
			print carPerDay[i]+'\n'
		}
		[carPerDay:carPerDay,days:days]
	}
}