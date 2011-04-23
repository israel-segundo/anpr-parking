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

      <g:link controller="person" action="index">
        <img src="${resource(dir:'images/icons',file:'808_1400_128_client_forum_persons_users_icon.png')}" title="Personas" alt="Personas" />
        <span>Personas</span>
      </g:link>

      <g:link controller="greenCar" action="index">
        <img src="${resource(dir:'images/icons',file:'117824_35391_128_garden_green_leaf_nature_icon.png')}" title="GreenCars" alt="GreenCars" />
        <span>Green Cars</span>
      </g:link>

      <g:link controller="maker" action="index">
        <img src="${resource(dir:'images/icons',file:'121715_40541_128_car_volkswagen_icon.png')}" title="Fabricantes" alt="Fabricantes" />
        <span>Fabricantes de autos</span>
      </g:link>

      <g:link controller="carModel" action="index">
        <img src="${resource(dir:'images/icons',file:'86094_62121_list_128x128.png')}" title="Modelos" alt="Modelos" />
        <span>Modelos de autos</span>
      </g:link>

    </div>

  </body>
</html>
