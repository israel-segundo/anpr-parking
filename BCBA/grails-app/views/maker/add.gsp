<!--
  To change this template, choose Tools | Templates
  and open the template in the editor.
-->

<%@ page contentType="text/html;charset=UTF-8" %>

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="layout" content="main" />
    <title>Agregar Nuevo Fabricante</title>

    <script type="text/javascript">
      $(document).ready( function(){
        $('#addForm').validate();
      });
      //}{
    </script>
  </head>
  <body>

    <div class="navigation-bar">
      <g:link controller="catalogue" action="index">Catálogos</g:link> -
      <g:link controller="maker" action="index">Fabricantes de Autos</g:link> -
      Agregar
    </div>

    <h1>Agregar Nuevo Fabricante</h1>

    <div id="contenido">

      <g:form id="addForm" name="addForm" action="add_store">

        <table>
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
