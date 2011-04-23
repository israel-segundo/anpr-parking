<!--
  To change this template, choose Tools | Templates
  and open the template in the editor.
-->

<%@ page contentType="text/html;charset=UTF-8" %>

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="layout" content="main" />
    <title>Agregar Auto</title>

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
            },
            plateNumber : {
              required:true
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
      <g:link controller="person" action="index">Personas</g:link> -
      <g:link controller="person" action="edit" id="${person.id}">Personas</g:link> -
      Agregar auto
    </div>

    <h1>Agregar Auto</h1>

    <div id="contenido">

      <g:form name="addForm" action="add_store">
        
        <g:hiddenField name="personId" value="${person.id}" />
        <table>

          <tr>
            <td>Fabricante</td>
            <td>
              <g:select optionKey="id"
                        optionValue="description"
                        name="maker"
                        from="${makers}"
                        noSelection="['0':'-Selecciona un fabricante-']"
              />
            </td>
          </tr>

          <tr>
            <td>Modelo</td>
            <td>
              <g:select name="carModel"
                        noSelection="['0':'-Selecciona un modelo-']"
              />
            </td>
          </tr>

          <tr>
            <td>Año</td>
            <td><g:textField class="required" name="year" /></td>
          </tr>

          <tr>
            <td>Placas</td>
            <td><g:textField class="required" name="plateNumber" /></td>
          </tr>

          <tr>
            <td colspan="2"><g:submitButton class="submit" name="add" value="Agregar" /></td>
          </tr>
        </table>

      </g:form>

    </div>
  </body>
</html>
