<!--
  To change this template, choose Tools | Templates
  and open the template in the editor.
-->

<%@ page contentType="text/html;charset=UTF-8" %>

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="layout" content="main" />
    <title>Editar Modelo de Auto</title>
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
      <g:link controller="carModel" action="index">Modelos de Auto </g:link> - Editar
    </div>

    <h1>Editar Modelo de Auto</h1>

    <div id="contenido">

      <g:form name="editForm" action="edit_store">
        <g:hiddenField name="id" value="${carModel.id}" />
        <table>

          <tr>
            <td>Fabricante</td>
            <td>
              <g:select optionKey="id"
                        optionValue="description"
                        name="maker"
                        from="${makers}"
                        value="${carModel.maker.id}"
                        noSelection="['0':'-Selecciona un fabricante-']"
              />
            </td>
          </tr>

          <tr>
            <td>Descripción</td>
            <td>
              <g:textField class="required"
                           value="${carModel.description}"
                           name="description" />
            </td>
          </tr>

          <tr>
            <td colspan="2"><g:submitButton class="submit" name="add" value="Agregar" /></td>
          </tr>
        </table>

      </g:form>
        
    </div>
  </body>
</html>
