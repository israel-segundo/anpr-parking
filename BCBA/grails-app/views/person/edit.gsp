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
      });
      //}{
    </script>
  </head>
  <body>
    <div class="navigation-bar">
      <g:link controller="catalogue" action="index">Catálogos </g:link> -
      <g:link controller="person" action="index">Personas </g:link> -
      Editar
    </div>

    <h1>Editar Persona</h1>
    <div id="contenido">

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
  </body>
</html>
