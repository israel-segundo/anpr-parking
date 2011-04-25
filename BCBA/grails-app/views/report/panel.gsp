<%@ page contentType="text/html;charset=UTF-8" %>

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="layout" content="main" />
    <title>Panel</title>
	<g:javascript src="raphael/raphael.js" />
	<g:javascript src="raphael/g.raphael-min.js" />	
	<g:javascript src="raphael/g.pie-min.js" />	
  </head>
  <body>
	<div class="navigation-bar">
    	<g:link controller="report" action="index">Reportes </g:link> - Panel
  	</div>
    <h1>Panel</h1>
    <div id="content">
		<div id ="gReport">
			<div id="holder">
			</div>
		</div>
    </div>
  </body>
</html>
