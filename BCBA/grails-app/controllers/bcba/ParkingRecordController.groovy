package bcba

class ParkingRecordController {

    def index = { ['registros': ParkingRecord.list() ] }

    def search = {
        
        ['registros': ParkingRecord.list() ]
    }

    def search_ajax = {

    }
}
