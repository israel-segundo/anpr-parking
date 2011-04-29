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
                    <th>13</th>
                    <th>14</th>
                    <th>15</th>
                    <th>16</th>
                    <th>17</th>
                    <th>18</th>
                    <th>19</th>
                    <th>19</th>
                    <th>20</th>
                    <th>22</th>
                    <th>23</th>
                    <th>24</th>
                    <th>25</th>
                    <th>26</th>
                    <th>27</th>
                    <th>28</th>
                    <th>29</th>
                    <th>30</th>
                    <th>31</th>
                </tr>
            </tfoot>
            <tbody>
                <tr>
                    <td>8</td>
                    <td>25</td>
                    <td>27</td>
                    <td>25</td>
                    <td>54</td>
                    <td>59</td>
                    <td>79</td>
                    <td>47</td>
                    <td>27</td>
                    <td>44</td>
                    <td>44</td>
                    <td>51</td>
                    <td>56</td>
                    <td>83</td>
                    <td>12</td>
                    <td>91</td>
                    <td>52</td>
                    <td>12</td>
                    <td>40</td>
                    <td>8</td>
                    <td>60</td>
                    <td>29</td>
                    <td>7</td>
                    <td>33</td>
                    <td>56</td>
                    <td>25</td>
                    <td>1</td>
                    <td>78</td>
                    <td>70</td>
                    <td>68</td>
                    <td>2</td>
                </tr>
            </tbody>
        </table>
    ${cars}
    <div id="holder">
    </div>
  </body>
</html>
