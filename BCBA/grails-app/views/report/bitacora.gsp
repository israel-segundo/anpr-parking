<%@ page contentType="text/html;charset=UTF-8" %>

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="layout" content="main" />
    <title>Entrada/Salida de Autos</title>
	<g:javascript src="raphael/raphael.js" />
	<g:javascript src="raphael/g.raphael-min.js" />
	<g:javascript src="raphael/g.pie-min.js" />
        <g:javascript src="raphael/popup.js" />
        <g:javascript src="raphael/jquery.js" />
        <g:javascript src="raphael/analytics.js" />
	<g:javascript>
		$(document).ready(
			function(){
                            window.onload = function (){
                            var data = [], data2 = [], data3 = [];

                            $("#entradas td").each(function () {
                                 data.push($(this).html());
                            });

                            $("#salidas td").each(function () {
                                 data2.push($(this).html());
                            });


                            $.each(data,function(index,value){
                                console.log(data[index]);
                                console.log(data2[index]);
                                data3.push(parseInt(data2[index])+parseInt(data[index]));
                                console.log(data3[index]);
                            })

                            graph(data3,"holderActividad");
                            graph(data2,"holderSalidas");
                            graph(data,"holderEntradas");


                            };
                        }
		);
	</g:javascript>
  </head>
  <body>
	<div class="navigation-bar">
    	<g:link controller="report" action="index">Reportes </g:link> - Entrada/Salida de Autos
  	</div>
    <h1>Entrada/Salida de Autos</h1>

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
    <h2>Entradas</h2>
    <div id="holderEntradas">
    </div>
    <h2>Salidas</h2>
    <div id="holderSalidas">
    </div>
    <h2>Actividad</h2>
    <div id="holderActividad"></div>
  </body>
</html>
