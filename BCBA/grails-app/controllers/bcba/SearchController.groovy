package bcba

import grails.converters.*

class SearchController {

    def index = { }
    def manualSearch = { }
    def advancedSearch = { }

    def automaticSearch = { }

    def consultPlate = {

        def result = ''

        // mandar llamar madres de gonzalo

        result = [
            'url'   : 'http://10.48.58.246/fotos/C360_2011-04-21%2015-37-42.jpg',
            'status': 'ok',
            'discount' : true,
            'time'  : 10000
        ]

        def converter = result as JSON

	render params.callback + "('" + converter.toString() + "')"
    }
}
