<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
    <title>BCBA Impulse :: <g:layoutTitle default="" /></title>
    <link rel="stylesheet" href="${resource(dir:'css',file:'main.css')}" />

    <link rel="stylesheet" href="${resource(dir:'css',file:'main.css')}" />
    <link rel="shortcut icon" href="${resource(dir:'images',file:'favicon.ico')}" type="image/x-icon" />

    <link rel="stylesheet" href="${resource(dir:'js/jquery-ui-1.8.11/css/redmond',file:'jquery-ui-1.8.11.custom.css')}" />
    <link rel="stylesheet" href="${resource(dir:'js/jquery-tablesorter/themes/blue',file:'style.css')}" />
    <!--<link rel="stylesheet" href="${resource(dir:'js/jquery-tablesorter/addons/pager/jquery.tablesorter.pager.css',file:'style.css')}" />-->

    <g:javascript src="jquery/jquery-1.5.1.min.js" />
    <g:javascript src="jquery-ui-1.8.11/js/jquery-ui-1.8.11.custom.min.js" />
    <g:javascript src="jquery-validate/jquery.validate.js" />
    <g:javascript src="jquery-validate/localization/messages_es.js" />
    <g:javascript src="jquery-tablesorter/jquery.tablesorter.js" />
    <g:javascript src="jquery-tablesorter/addons/pager/jquery.tablesorter.pager.js" />

    <script type="text/javascript">
      $(document).ready(function(){

        setTimeout(function(){
          
          $('.info').fadeOut('slow', function () {
            $('.info').remove();
          });
        }, 4000);

      });
    </script>

    <g:layoutHead />
  </head>

  <body>

     <!-- Begin Wrapper -->
     <div id="wrapper">

           <!-- Begin Header -->
           <div id="header">
             <img src="${resource(dir:'images',file:'logo_home.gif')}" />
           </div>
           <!-- End Header -->

           <!-- Begin Navigation -->
           <div id="navigation">
             <ul id="menu">
               <li><g:link controller="search" action="automaticSearch">Búsqueda Automática</g:link></li>
               <li><g:link controller="search" action="manualSearch">Búsqueda Manual</g:link></li>
               <li><g:link controller="governmentCar" action="add">Registro de Autos Externos</g:link></li>
               <li><g:link controller="search" action="advancedSearch">Búsqueda Avanzada</g:link></li>
               <li><g:link controller="catalogue" action="index">Catálogo</g:link></li>
             </ul>
           </div>
           <!-- End Navigation -->

           <!-- Begin Faux Columns -->
           <div id="faux">

             <g:if test="${flash.info}">
                <g:each in="${flash.info}" var="msg">
                    <div class="info">${msg}</div>
                </g:each>
            </g:if>

             <g:if test="${flash.error}">
                <g:each in="${flash.error}" var="msg">
                    <div class="error">${msg}</div>
                </g:each>
            </g:if>

             <!-- Begin Right Column -->
             <div id="content">
                <g:layoutBody />
                <div class="clear"></div>

             </div>
             <!-- End Right Column -->

             <div class="clear"></div>

           </div>
           <!-- End Faux Columns -->

           <!-- Begin Footer -->
           <div id="footer">
             Av. Santa Fé No. 495 Piso 23, Col. Cruz Manca, México D.F., C.P. 05349
             <br/>
             Tel. +52 (55) 50908000 / call center de ventas: +52 (55) 50908080
           </div>
           <!-- End Footer -->

     </div>
     <!-- End Wrapper -->
  </body>
</html>
