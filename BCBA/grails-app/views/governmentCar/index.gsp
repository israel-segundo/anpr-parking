<!--
  To change this template, choose Tools | Templates
  and open the template in the editor.
-->

<%@ page contentType="text/html;charset=UTF-8" %>

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="layout" content="main" />
    <title>Catálogo de Autos Registrados en Tesorería</title>
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
    </script>
  </head>
  <body>

    <div id="dialog-confirm" style="display:none;" title="¿Eliminar?">
      <p>
        <span class="ui-icon ui-icon-alert" style="float:left; margin:0 7px 20px 0;"></span>
        Este elemento será eliminado de forma permanente y no podrá ser recuperado. ¿Estás seguro?
      </p>
    </div>

    <div class="navigation-bar">
      <g:link controller="catalogue" action="index">Catálogos </g:link>- Green Cars
    </div>

    <h1>Catálogo de Autos Registrados en Tesorería</h1>

    <div id="contenido">

      <div class="operation-menu">

        <div class="operation-button">
          <g:link controller="governmentCar" action="add">
             <img src="${resource(dir:'images/icons',file:'118379_35949_32_add_database_icon.png')}" title="Agregar" alt="Agregar" />
             <span>Agregar nuevo auto ecológico</span>
          </g:link>
        </div>

        <div class="operation-button">
          <g:link controller="governmentCar" action="upload_file">
             <img src="${resource(dir:'images/icons',file:'118679_36249_32_excel_page_icon.png')}" title="Cargar archivo" alt="Cargar Archivo" />
             <span>Cargar formato</span>
          </g:link>
        </div>
      </div>
      <div class="clear"></div>
      <div id="contenido-contenido">

        <div>
          <table id="myTable" class="tablesorter">
            <thead>
              <tr>
                  <th>ID</th>
                  <th>Fabricante</th>
                  <th>Modelo</th>
                  <th>Año</th>
                  <th>Fecha de Creación</th>
                  <th>Fecha de Modificación</th>
                  <th>Acciones</th>
              </tr>
            </thead>

            <tbody>

              <g:each var="governmentCar" in="${governmentCars}">

                <tr>
                    <td>${governmentCar.id}</td>
                    <td>${governmentCar.carModel.maker.description}</td>
                    <td>${governmentCar.carModel.description}</td>
                    <td>${governmentCar.year}</td>
                    <td>${governmentCar.dateCreated}</td>
                    <td>${governmentCar.lastUpdated}</td>
                    <td>
                        <g:link controller="governmentCar" action="edit" id="${governmentCar.id}">
                           <img src="${resource(dir:'images/icons',file:'118799_36369_32_edit_report_icon.png')}" title="Editar" alt="Editar" />
                        </g:link>

                        <g:link class="delete_link" controller="governmentCar" action="delete" id="${governmentCar.id}">
                           <img src="${resource(dir:'images/icons',file:'113269_29299_22_close_delete_dialog_disabled_icon.png')}" title="Eliminar" alt="Eliminar" />
                        </g:link>
                    </td>
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
