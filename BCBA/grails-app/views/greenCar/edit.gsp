<!--
  To change this template, choose Tools | Templates
  and open the template in the editor.
-->

<%@ page contentType="text/html;charset=UTF-8" %>

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="layout" content="main" />
    <title>Editar Auto Ecológico o Green Car</title>
    <script type="text/javascript">

      $(document).ready( function(){

        jQuery.validator.addMethod('selected', function(value, element) {
              return value != 0;
          },
          'Debes seleccionar una opción'
        );

        $('#addForm').validate({
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
      <g:link controller="greenCar" action="index">Green Cars </g:link> -
      Editar
    </div>

    <h1>Editar Auto Ecológico o Green Car</h1>
    <div id="contenido">

      <g:form id="addForm" name="addForm" action="add_store">

        <table>

          <tr>
            <td>Fabricante</td>
            <td>
              <g:select optionKey="id"
                        optionValue="description"
                        name="maker"
                        from="${makers}"
                        value="${greenCar.carModel.maker.id}"
              />
            </td>
          </tr>

          <tr>
            <td>Modelo</td>
            <td>
              <g:select name="carModel"
                        optionKey="id"
                        optionValue="description"
                        from="${greenCar.carModel.maker.carModels}"
                        value="${greenCar.carModel.id}"
              />
            </td>
          </tr>

          <tr>
            <td>Año</td>
            <td><g:textField class="required" name="year" value="${greenCar.year}"/></td>
          </tr>

          <tr>
            <td colspan="2"><g:submitButton class="submit" name="add" value="Agregar" /></td>
          </tr>
        </table>

      </g:form>

    </div>
  </body>
</html>
