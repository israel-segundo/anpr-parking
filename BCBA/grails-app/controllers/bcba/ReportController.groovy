package bcba

class ReportController
{
	def index = {
		
	}
	def panel = {
		
	}
	def frequent = {
		
	}
	def bitacora = {
		
	}
	def comparative = {
		/*def greenCars = Car.findByDiscount(1);
		def otherCars = Car.findByDiscount(0);
		print otherCars
		[greenCars:greenCars]*/
		def example = Person.get(1).cars
		
		print example
		[example:example]
	}
	def resume = {
		
	}
}