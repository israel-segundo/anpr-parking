<%@ page contentType="text/html;charset=UTF-8" %>

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="layout" content="main" />
    <title>Autos Verdes vs Autos Normales</title>
	<g:javascript src="raphael/raphael.js" />
	<g:javascript src="raphael/g.raphael-min.js" />	
	<g:javascript src="raphael/g.pie-min.js" />	
	<g:javascript>
		$(document).ready(
			function()
			{
					var containerWidth=$('#gReport').width();
					var containerHeight=$('#gReport').height();
					var PieRadius = 80;
					
					var r = Raphael("gReport");
					var graphCenter = containerWidth/2;

		            r.g.text(graphCenter, 60, "Porcentaje de autos verdes/contaminantes").attr({"font-size": 20});
					
					var pie = r.g.piechart(graphCenter,200,PieRadius,[${percentage[0]},${percentage[1]}],
						{
							legend:["%%.%% No Ecológicos","%%.%% Verdes"],
							legendpos:"west"
						}
					);
					pie.hover(
						function()
						{
							this.sector.stop();//detiene la animacion actual
							this.sector.scale(1.2,1.2,this.cx,this.cy);
							if(this.label)
							{
								this.label[0].stop();
								this.label[0].scale(1.8);
								this.label[1].attr({"font-weight": 800});
							}
						},
						function(){
							this.sector.animate({scale:[1,1,this.cx,this.cy]},500,"bounce");
							if(this.label)
							{
								this.label[0].animate({scale:1},200,"bounce");
								this.label[1].attr({"font-weight": 400});
							}
						}
					);									
			}
		);
	</g:javascript>
  </head>
  <body>
	<div class="navigation-bar">
    	<g:link controller="report" action="index">Reportes </g:link> - Autos Verdes vs Autos Normales
  	</div>
    <h1>Autos Verdes vs Autos Normales</h1>
    <div id="content">
		<div id = "gReport">
		</div>
    </div>
  </body>
</html>
