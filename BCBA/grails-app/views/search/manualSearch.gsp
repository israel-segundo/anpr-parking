<!--
  To change this template, choose Tools | Templates
  and open the template in the editor.
-->

<%@ page contentType="text/html;charset=UTF-8" %>

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="layout" content="main" />
    <title>Búsqueda Manual</title>
  </head>
  <body>
    <h1>Búsqueda Manual</h1>
    <div class="form">

      <div class="automatic-form-field">
        <table>
          <tr>
            <td>
              Placa
            </td>
          </tr>
          <tr>
            <td>
              <input type="text" id="placa" name="placa" />
            </td>
          </tr>
          <tr>
            <td>
              <input type="submit" value="Buscar"/>
            </td>
          </tr>
        </table>
      </div>

      <div class="form-results">
        En espera de placa ...
      </div>

    </div>
  </body>
</html>
