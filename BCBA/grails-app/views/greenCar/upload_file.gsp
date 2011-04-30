<!--
  To change this template, choose Tools | Templates
  and open the template in the editor.
-->

<%@ page contentType="text/html;charset=UTF-8" %>

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="layout" content="main" />
    <title>Cargar formato de autos verdes</title>
    <script type="text/javascript">

      $(document).ready( function(){

        $('#uploadForm').validate();
      });
      //}{
    </script>
  </head>
  <body>
    <h1>Cargar formato de autos verdes</h1>

    <div id="contenido">

      <g:uploadForm name="uploadForm" action="upload_store">

        <table>

          <tr>
            <td>Archivo</td>
            <td><input type="file" class="required" name="file"/> </td>
          </tr>

          <tr>
            <td colspan="2"><g:submitButton class="submit" name="add" value="Agregar" /></td>
          </tr>
        </table>

      </g:uploadForm>

    </div>
  </body>
</html>