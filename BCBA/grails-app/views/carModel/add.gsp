<!--
  To change this template, choose Tools | Templates
  and open the template in the editor.
-->

<%@ page contentType="text/html;charset=UTF-8" %>

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="layout" content="main" />
    <title>Agregar Modelo de Auto</title>

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
            description: {
              required: true
            }
          }
        });

      });
      //}{
    </script>

  </head>
  <body>

    <div class="navigation-bar">
      <g:link controller="catalogue" action="index">Catálogos </g:link> -
      <g:link controller="carModel" action="index">Modelos de Auto </g:link> - Agregar
    </div>

    <h1>Agregar Modelo de Auto</h1>

    <div id="contenido">

      <g:form name="addForm" action="add_store">

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
            <td>Descripción</td>
            <td><g:textField class="required" name="description" /></td>
          </tr>

          <tr>
            <td colspan="2"><g:submitButton class="submit" name="add" value="Agregar" /></td>
          </tr>
        </table>

      </g:form>

    </div>
  </body>
</html>
