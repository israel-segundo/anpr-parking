<%@ page contentType="text/html;charset=UTF-8" %>

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="layout" content="main" />
    <title>Autos Parqueados</title>
	<g:javascript src="raphael/raphael.js" />
	<g:javascript src="raphael/g.raphael-min.js" />	
	<g:javascript src="raphael/g.pie-min.js" />
        <g:javascript src="raphael/popup.js" />
        <g:javascript src="raphael/jquery.js" />
        <g:javascript src="raphael/analytics.js" />
	<g:javascript>
		
	</g:javascript>
  </head>
  <body>
  <div class="navigation-bar">
    <g:link controller="report" action="index">Reportes </g:link> - Autos Parqueados
  </div>
    <h1>Autos Parqueados</h1>
    <table id="labels" class="data">
                <tr>
                    <th>1</th>
                    <th>2</th>
                    <th>3</th>
                    <th>4</th>
                    <th>5</th>
                </tr>
    </table>
    <table id="entradas" class="data">
             <tr>
                    <td>0</td>
                    <td>25</td>
                    <td>50</td>
                    <td>75</td>
                    <td>120</td>
                </tr>
    </table>

    <table id="salidas" class="data">
      <tr>
                    <td>0</td>
                    <td>25</td>
                    <td>50</td>
                    <td>75</td>
                    <td>100</td>
                    
                </tr>
    </table>
    ${cars}
    <div id="holderEntradas">
    </div>
    <div id="holderSalidas">
    </div>
    <div id="holderActividad"></div>
  </body>
</html>
