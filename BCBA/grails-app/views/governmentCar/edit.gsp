<!--
  To change this template, choose Tools | Templates
  and open the template in the editor.
-->

<%@ page contentType="text/html;charset=UTF-8" %>

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="layout" content="main" />
    <title>Editar Auto De Gobierno</title>
    <script type="text/javascript">

      $(document).ready( function(){

        jQuery.validator.addMethod('selected', function(value, element) {
              return value != 0;
          },
          'Debes seleccionar una opción'
        );

        $('#editForm').validate({
          rules : {
            maker : {
              selected: true
            },
            carModel: {
              selected: true
            },
            year: {
              required: true,
              number: true,
              min: 1990
            }
          }
        });

        $("#maker").change(function(){
          $('#carModel').empty();

          var url = ""+'/BCBA/maker/getCarModels?id=' + $("#maker").val()+"&callback=?";

          $.getJSON(
            url, function( data ){
              console.log( $.parseJSON(data) );
              data = $.parseJSON(data);

              $.each( data, function( key, value ){
                console.log(value);
                $('#carModel').append(
                  $('<option></option>').attr('value', value.id).html(value.description)
                );
              });
            }
          );

        });
      });
      //}{
    </script>
  </head>
  <body>

    <div class="navigation-bar">
      <g:link controller="catalogue" action="index">Catálogos </g:link> -
      <g:link controller="governmentCar" action="index">Autos de Gobierno</g:link> -
      Editar
    </div>

    <h1>Editar Auto de Gobierno</h1>
    <div id="contenido">

      <g:form name="editForm" action="edit_store">
        <g:hiddenField name="id" value="${gCar.id}" />
        <table>
          <tr>
            <td>Placas</td>
            <td><g:textField class="required" name="plateNumber" value="${gCar.plateNumber}"/></td>
          </tr>
          <tr>
            <td>Fabricante</td>
            <td>
              <g:select optionKey="id"
                        optionValue="description"
                        name="maker"
                        from="${makers}"
                        value="${gCar.carModel.maker.id}"
              />
            </td>
          </tr>

          <tr>
            <td>Modelo</td>
            <td>
              <g:select name="carModel"
                        optionKey="id"
                        optionValue="description"
                        from="${gCar.carModel.maker.carModels}"
                        value="${gCar.carModel.id}"
              />
            </td>
          </tr>

          <tr>
            <td>Año</td>
            <td><g:textField class="required" name="year" value="${gCar.year}"/></td>
          </tr>

          <tr>
            <td colspan="2"><g:submitButton class="submit" name="add" value="Agregar" /></td>
          </tr>
        </table>

      </g:form>

    </div>
  </body>
</html>
