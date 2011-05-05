<!--
  To change this template, choose Tools | Templates
  and open the template in the editor.
-->

<%@ page contentType="text/html;charset=UTF-8" %>

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="layout" content="main" />
    <title>Registro de entradas en estacionamiento</title>
    <script type="text/javascript">
      $(document).ready(function()
          {
              $("#myTable")
                .tablesorter({widthFixed: true, widgets: ['zebra']})
                .tablesorterPager({
                  container: $("#pager"),
                  positionFixed: false
                });

              $('.delete_link').click( function(event){

                var link = $(this);
                $( "#dialog-confirm" ).dialog({
                        resizable: false,
                        height:140,
                        modal: true,
                        buttons: {
                                "Eliminar": function() {
                                    $( this ).dialog( "close" );
                                    window.location = link.attr('href');
                                },
                                'Cancelar': function() {
                                    $( this ).dialog( "close" );
                                    event.preventDefault();
                                }
                        }
                });

                event.preventDefault();
              });
          }
      );
      //}{
    </script>

  </head>
  <body>

    <div class="navigation-bar">
      Registro de Estacionamiento
    </div>

    <h1>Registro de Estacionamiento</h1>

    <div id="contenido">

      <div>
        <div>
          <table id="myTable" class="tablesorter">
            <thead>
              <tr>
                  <th>ID</th>
                  <th>Placa</th>
                  <th>¿Descuento?</th>
                  <th>Entrada</th>
                  <th>Salida</th>
              </tr>
            </thead>

            <tbody>

              <g:each var="registro" in="${registros}">

                <tr>
                    <td>${registro.id}</td>
                    <td>${registro.plateNumber}</td>
                    <td>${registro.discount}</td>
                    <td>${registro.entranceDate}</td>
                    <td>${registro.exitDate}</td>
                </tr>

              </g:each>

            </tbody>
          </table>
        </div>
        <div>
          <div id="pager" class="pager">
            <form action="" >
              <img alt=""  src="${resource(dir:'images/icons',file:'first.png')}" class="first"/>
              <img alt=""  src="${resource(dir:'images/icons',file:'prev.png')}" class="prev"/>
              <input type="text" class="pagedisplay"/>
              <img alt=""  src="${resource(dir:'images/icons',file:'next.png')}" class="next"/>
              <img alt=""  src="${resource(dir:'images/icons',file:'last.png')}" class="last"/>
              <select class="pagesize">
                      <option selected="selected"  value="10">10</option>
                      <option value="20">20</option>
                      <option value="30">30</option>
                      <option  value="40">40</option>
              </select>
            </form>
          </div>
        </div>
      </div>
    </div>

  </body>
</html>
