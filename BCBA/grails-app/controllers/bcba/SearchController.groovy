package bcba

import grails.converters.*
import bcba.anpr.*;


class SearchController {

    def index = { }
    def manualSearch = { 
		print "Que pedo puto!!"
	}
    def advancedSearch = { 
		
	}

    def automaticSearch = { }

    def consultPlate = {

        
		def recognizer = new PlateRecognizer("http://192.168.1.114")
		def result = recognizer.processImage()
		
		
		result.put('discount', 'true')
		
        /*result = [
            'url'   : processResult.get('url'),
            'status': processResult.get('status'),
            'discount' : true,
            'time'  : processResult.get('time')
        ]*/

        def converter = result as JSON

	render params.callback + "('" + converter.toString() + "')"
    }
	
}
