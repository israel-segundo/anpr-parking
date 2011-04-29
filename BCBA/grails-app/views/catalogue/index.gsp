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

    <div class="catalogue">

      <div class="catalogue-menu">
        <g:link controller="person" action="index">
          <table>
            <tr><td><img src="${resource(dir:'images/icons',file:'808_1400_128_client_forum_persons_users_icon.png')}" title="Personas" alt="Personas" /></td></tr>
            <tr><td><span class="label">Personas</span></td></tr>
          </table>
        </g:link>
      </div>

      <div class="catalogue-menu">
        <g:link controller="greenCar" action="index">
          <table>
            <tr><td><img src="${resource(dir:'images/icons',file:'117824_35391_128_garden_green_leaf_nature_icon.png')}" title="GreenCars" alt="GreenCars" /></td></tr>
            <tr><td><span class="label">Green Cars</span></td></tr>
          </table>
        </g:link>
      </div>

      <div class="catalogue-menu">
        <g:link controller="maker" action="index">
          <table>
            <tr><td><img src="${resource(dir:'images/icons',file:'121715_40541_128_car_volkswagen_icon.png')}" title="Fabricantes" alt="Fabricantes" /></td></tr>
            <tr><td><span class="label">Fabricantes de autos</span></td></tr>
          </table>
        </g:link>
      </div>

      <div class="catalogue-menu">

        <g:link controller="carModel" action="index">
          <table>
            <tr><td><img src="${resource(dir:'images/icons',file:'86094_62121_list_128x128.png')}" title="Modelos" alt="Modelos" /></td></tr>
            <tr><td><span class="label">Modelos de autos</span></td></tr>
          </table>
        </g:link>
      </div>

      <div class="catalogue-menu">
        <g:link controller="report" action="index">
          <table>
            <tr><td><img src="${resource(dir:'images/icons',file:'115360_32671_128_geometric_graphics_icon.png')}" title="Reportes" alt="Reportes" /></td></tr>
            <tr><td><span class="label">Reportes</span></td></tr>
          </table>
        </g:link>
      </div>

      <div class="catalogue-menu">
        <g:link controller="governmentCar" action="index">
          <table>
            <tr><td><img src="${resource(dir:'images/icons',file:'86094_62121_list_128x128.png')}" title="Gobierno" alt="Gobierno" /></td></tr>
            <tr><td><span class="label">Base de datos de Gobierno</span></td></tr>
          </table>
        </g:link>
      </div>
    </div>

  </body>
</html>
