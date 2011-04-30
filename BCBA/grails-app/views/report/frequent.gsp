<%@ page contentType="text/html;charset=UTF-8" %>

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="layout" content="main" />
    <title>Autos Frecuentes</title>
	<g:javascript src="raphael/jquery.js" />
        <g:javascript src="raphael/raphael.js" />
	<g:javascript src="raphael/g.raphael.js" />	
	<g:javascript src="raphael/g.bar.js" />
	<g:javascript>
		$(document).ready(
			function(){
                            $(function () {
                                $("#data").css({
                                    position: "absolute",
                                    left: "-9999em",
                                    top: "-9999em"
                                });
                            });
                            var data = [];
                            var matriculas = [];
                            window.onload = function () {
                                $("#data tbody td").each(function () {data.push($(this).html());});
                                $("#data tfoot th").each(function () {matriculas.push($(this).html());});
                                var r = Raphael("holder"),
                                fin = function () {
                                    this.flag = r.g.popup(this.bar.x, this.bar.y, this.bar.value || "0").insertBefore(this);
                                },
                                fout = function () {
                                    this.flag.animate({opacity: 0}, 300, function () {this.remove();});
                                };
                                r.g.txtattr.font = "12px 'Fontin Sans', Fontin-Sans, sans-serif";
                                r.g.barchart(50, 20, 600, 220, [data], {stacked: true, type: "soft"}).hover(fin, fout).label(matriculas);
                              };
                        }
		);
	</g:javascript>
  </head>
  <body>
	<div class="navigation-bar">
    	<g:link controller="report" action="index">Reportes </g:link> - Autos Frecuentes
  	</div>

    <table id="data">
	<tfoot>
	  <tr>
            <th>1</th>
            <th>2</th>
            <th>3</th>
            <th>4</th>
            <th>5</th>
            <th>6</th>
            <th>7</th>
            <th>8</th>
            <th>9</th>
            <th>10</th>
            <th>11</th>
            <th>12</th>
          </tr>
	</tfoot>
        <tbody>
          <tr>
            <td>8</td>
            <td>25</td>
            <td>27</td>
            <td>25</td>
            <td>25</td>
            <td>25</td>
            <td>8</td>
            <td>25</td>
            <td>27</td>
            <td>25</td>
            <td>25</td>
            <td>25</td>
          </tr>
        </tbody>
      </table>
    <h1>Autos Frecuentes</h1>
    <div id="holder">
    </div>
  </body>
</html>
