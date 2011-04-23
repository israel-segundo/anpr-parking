<!--
  To change this template, choose Tools | Templates
  and open the template in the editor.
-->

<%@ page contentType="text/html;charset=UTF-8" %>

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="layout" content="main" />
    <title>Editar Persona</title>
    <script type="text/javascript">

      $(document).ready( function(){

          $('#addForm').validate({
            rules : {
              name : {
                required: true
              },
              lastName: {
                required: true
              },
              year: {
                required: true,
                email: true
              }
            }
          });

          $("#myTable")
            .tablesorter({widthFixed: true, widgets: ['zebra']})
            .tablesorterPager({
              container: $("#pager"),
              positionFixed: false
            });

          $('.delete_link').click( function(event){
            var link = $(this);
            $("#dialog-confirm").dialog({
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

        });
      //}{
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
      <g:link controller="catalogue" action="index">Catálogos </g:link> -
      <g:link controller="person" action="index">Personas </g:link> -
      Editar
    </div>

    <h1>Editar Persona</h1>
    <div id="contenido">

      <div>
        <div>
            <g:form name="editForm" action="edit_store">
            <g:hiddenField name="id" value="${person.id}" />
            <table>

              <tr>
                <td>Nombre</td>
                <td><g:textField class="required" name="name" value="${person.name}" /></td>
              </tr>

              <tr>
                <td>Apellidos</td>
                <td><g:textField class="required" name="lastName" value="${person.lastName}"/></td>
              </tr>

              <tr>
                <td>Email</td>
                <td><g:textField class="required email" name="email" value="${person.email}" /></td>
              </tr>

              <tr>
                <td colspan="2"><g:submitButton class="submit" name="add" value="Agregar" /></td>
              </tr>
            </table>

          </g:form>
        </div>

        <div>
          <br/><br/><br/>
          <h2>Autos Asignados</h2>

          <div class="add_button">
            <g:link controller="car" action="add" id="${person.id}">
               <img src="${resource(dir:'images/icons',file:'118247_35817_32_add_car_icon.png')}" title="Agregar" alt="Agregar" />Agregar nuevo auto
            </g:link>
          </div>
          <br/><br/>
          <g:if test="${ person.cars.empty }">
               Esta persona no tiene autos asociados
          </g:if>
          <g:else>
               
            <table id="myTable" class="tablesorter">
              <thead>
                <tr>
                    <th>Placas</th>                  
                    <th>Fabricante</th>
                    <th>Modelo</th>
                    <th>Año</th>
                    <th>¿Aplica descuento?</th>
                    <th>Acciones</th>
                </tr>
              </thead>

              <tbody>

                <g:each var="car" in="${person.cars}">
                  <tr>
                    
                      <td>${car.plateNumber}</td>
                      <td>${car.carModel.maker.description}</td>
                      <td>${car.carModel.description}</td>
                      <td>${car.year}</td>
                      <td>
                        <g:if test="${car.discount}">
                          <img src="${resource(dir:'images/icons',file:'21038_24630_16_circle_green_check_icon.png')}" title="Valido" alt="Valido" />
                        </g:if>
                        <g:else>
                          <img src="${resource(dir:'images/icons',file:'100657_76469_gtk-dialog-error_20x20.png')}" title="No aplica" alt="No aplica" />
                        </g:else>
                      </td>

                      <td>
                        <g:link controller="car" action="edit" id="${car.id}">
                           <img src="${resource(dir:'images/icons',file:'118799_36369_32_edit_report_icon.png')}" title="Editar" alt="Editar" />
                        </g:link>

                        <g:link class="delete_link" controller="car" action="delete" id="${car.id}">
                           <img src="${resource(dir:'images/icons',file:'113269_29299_22_close_delete_dialog_disabled_icon.png')}" title="Eliminar" alt="Eliminar" />
                        </g:link>                        
                      </td>
                      
                  </tr>
                </g:each>
              </tbody>
            </table>
          </g:else>
        </div>
      </div>
    </div>
  </body>
</html>
