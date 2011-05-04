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
          $('.spinner').css('padding-top', '120px');
          $('.spinner').css('padding-left', '200px');
          $('.spinner').css('display', 'block');
      }

      $(document).ready( function(){

        $('#registrarLlegadaButton').click( function(event){

          muestraSpinner();

          var url = ""+'/BCBA/search/consultPlate?callback=?';

          $.getJSON(
            url, function( data ){

              console.log( $.parseJSON(data) );

              $('.spinner').css('display', 'none');

              data = $.parseJSON(data);

              $('.search-result').prepend('<img id="theImg" height="50%" width="50%" src="'+data.url+'" />')
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

          </div>
          <div class="clear"></div>
      </div>

    </div>
  </body>
</html>
