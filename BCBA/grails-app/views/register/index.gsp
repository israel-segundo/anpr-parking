<%@ page contentType="text/html;charset=UTF-8" %>

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="layout" content="main" />
    <title>Registro de Autos</title>
    <g:javascript src="jquery-validate/jquery.validate.js" />
    <g:javascript src="jquery-validate/localization/messages_es.js" />
    <g:javascript>

      $(document).ready(function(){

        $('#carForm').validate();

      });

    </g:javascript>
<!--$(){}-->
  </head>
  <body>

    <div>
      <h1>Registro de Autos</h1>

      <div class="form">
        <g:form controller="car" action="add" name="carForm" >

          <table>
            <tr>
              <td>Año</td>
              <td><g:textField id="yearField" name="year" class="required numeric" /></td>
            </tr>
            <tr>
              <td>Color</td>
              <td><g:textField id="colorField" name="color" class="required" /></td>
            </tr>
            <tr>
              <td>¿Aplica descuento?</td>
              <td><g:checkBox name="discount" /></td>
            </tr>
            <tr>
              <td>Placas</td>
              <td><g:textField id="plateNumberField" name="plateNumber" class="required" /></td>
            </tr>

            <tr>
              <td><g:submitButton name="submit" value="Guardar"/></td>
              <td></td>
            </tr>
            
          </table>

        </g:form>
      </div>
    </div>
    
  </body>
</html>
