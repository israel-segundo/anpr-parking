<!--
  To change this template, choose Tools | Templates
  and open the template in the editor.
-->

<%@ page contentType="text/html;charset=UTF-8" %>

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Editar Fabricante de Autos</title>
    <meta name="layout" content="main" />

    <script type="text/javascript">
      $(document).ready( function(){
        $('#editForm').validate();
      });
      //}{
    </script>
  </head>
  <body>

    <div class="navigation-bar">
      <g:link controller="catalogue" action="index">Catálogos</g:link> -
      <g:link controller="maker" action="index">Fabricantes de Autos</g:link> -
      Editar
    </div>

    <h1>Editar Fabricante de Autos</h1>

    <div id="contenido">

      <g:form id="editForm" name="editForm" action="edit_store">

        <g:hiddenField name="id" value="${maker.id}" />
        <table>
          <tr>
            <td>Descripción</td>
            <td>
              <g:textField class="required"
                           name="description"
                           value="${maker.description}"
              />
            </td>
          </tr>

          <tr>
            <td colspan="2"><g:submitButton class="submit" name="edit" value="Editar" /></td>
          </tr>
        </table>

      </g:form>

    </div>
  </body>
</html>
