<%@ page contentType="text/html;charset=UTF-8" %>

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="layout" content="main" />
    <title>Reportes</title>
	<g:javascript src="raphael/raphael.js" />
	<g:javascript src="raphael/g.raphael-min.js" />	
	<g:javascript src="raphael/g.pie-min.js" />	
	<g:javascript>
		
	</g:javascript>
  </head>
  <body>
    <h1>Reportes</h1>
    <div id="content">
		<div id="indexReport">
			<ul>
				<li><g:link controller="report" action="panel">Reporte General</g:link></li>
				<li><g:link controller="report" action="frequent">Autos Frecuentes</g:link></li>
				<li><g:link controller="report" action="bitacora">Entrada y Salida de Autos</g:link></li>
				<li><g:link controller="report" action="comparative">Autos Verdes vs Autos no Verdes?</g:link></li>
				<li><g:link controller="report" action="resume">Autos Parqueados</g:link></li>
			</ul>
		</div>
    </div>
  </body>
</html>
