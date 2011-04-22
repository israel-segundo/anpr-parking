<!--
  To change this template, choose Tools | Templates
  and open the template in the editor.
-->

<%@ page contentType="text/html;charset=UTF-8" %>

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="layout" content="main" />
    <title>Catálogos</title>
  </head>
  <body>
    <h1>Catálogos</h1>

    <ul>
      <li><g:link controller="person" action="index">Personas</g:link></li>
      <li><g:link controller="greenCar" action="index">Green Cars</g:link></li>
      <li><g:link controller="maker" action="index">Fabricantes de autos</g:link></li>
      <li><g:link controller="carModel" action="index">Modelos de autos</g:link></li>
    </ul>
  </body>
</html>
