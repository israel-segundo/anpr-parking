package bcba

import java.text.SimpleDateFormat

class ParkingRecordController {

    def index = { ['registros': ParkingRecord.list() ] }

    def search = {
        
        def placa = params.placa
        def del   = params.del
        def hasta = params.hasta
        def registros = ParkingRecord.list()
        
        if( placa != null && placa != '' ){
            registros = registros.findAll{ registro -> registro.plateNumber == placa }
        }

        if( del != null && del != ''){

            def df1 = new SimpleDateFormat('dd/MM/yyyy')
            def date = df1.parse(del)
            registros = registros.findAll{ registro -> registro.entranceDate >= date }
        }

        if( hasta != null && hasta != '' ){

            def df1 = new SimpleDateFormat('dd/MM/yyyy')
            def date = df1.parse(hasta)
            date.plus(1)
            registros = registros.findAll{ registro -> registro.entranceDate <= date }
        }

        [ 'registros': registros ]
    }
}
