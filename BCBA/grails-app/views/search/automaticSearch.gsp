<!--
  To change this template, choose Tools | Templates
  and open the template in the editor.
-->

<%@ page contentType="text/html;charset=UTF-8" %>

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="layout" content="main" />
    <title>Búsqueda Automática</title>
    <script type="text/javascript">

      function muestraSpinner(){
          $('.spinner').css('padding-top', '130px');
          $('.spinner').css('padding-left', '250px');
          $('.spinner').css('display', 'block');
      }

      $(document).ready( function(){

        $('#registrarLlegadaButton').click( function(event){

          $('.search-ajax-result').css('display','none');

          muestraSpinner();
          
          var url = ""+'/BCBA/search/consultPlate?callback=?';

          $.getJSON(
            url, function( data ){

              console.log( $.parseJSON(data) );

              $('.spinner').css('display', 'none');

              data = $.parseJSON(data);

              $('#imagen-foto').attr( 'src', data.url );
              $('#placa').html( data.plate );
              $('#ms').html( data.time );

              var discount_img  = '/BCBA/images/icons/109650_26576_16_leaf_minus_icon.png';

              if( data.discount == 'false' ){
                discount_img  = '/BCBA/images/icons/109655_26581_16_leaf_icon.png';
              }

              $('#imagen-descuento').attr( 'src', discount_img);

              $('.search-ajax-result').fadeIn('slow');
            }
          );
          
          event.preventDefault();
        });

      });
      //}{
      
    </script>
  </head>
  <body>
    <h1>Búsqueda Automática</h1>

    <div class="content">

      <div class="search-module">

          <div class="search-controls">

              <div class="llegada-button">
                <a href="#" id="registrarLlegadaButton">
                   <img src="${resource(dir:'images/icons',file:'118246_35816_32_car_icon.png')}" title="Agregar" alt="Agregar" />
                   <span>Registrar llegada</span>
                </a>
              </div>

          </div>

          <div class="search-result">

            <div class="spinner">
              <img src="${resource(dir:'images/icons',file:'spinner.gif')}" title="Cargando" alt="Cargando" />
            </div>

            <div class="search-ajax-result">

              <div class="search-ajax-result-titulo">Resultado de la búsqueda</div>

              <div class="search-ajax-result-image">
                <img id="imagen-foto" src="" height="200px"  width="270px"/>
              </div>

              <div class="search-ajax-result-datos">
                  <table>
                    <tr>
                      <td>
                        Placa:
                      </td>
                      <td>
                        <span id="placa"></span>
                      </td>
                    </tr>

                    <tr>
                      <td>
                        Tiempo de procesamiento:
                      </td>
                      <td>
                        <span id="ms"></span>&nbsp;ms
                      </td>
                    </tr>

                    <tr>
                      <td>
                        ¿Aplica descuento?:
                      </td>
                      <td>
                        <img id="imagen-descuento" src="" />
                      </td>
                    </tr>

                  </table>
              </div>

              <div class="acciones">

                <div class="llegada-button">
                  <a href="#" id="Registrar">
                     <span>Dar de alta</span>
                  </a>
                </div>
                
                <br/><br/><br/><br/>
              </div>

            </div>
          </div>
          <div class="clear"></div>
      </div>

    </div>
  </body>
</html>
