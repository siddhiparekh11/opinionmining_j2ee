
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">

<%@ page import="java.awt.*"%>
<%@ page import="java.io.*"%>
<%@ page import="javax.servlet.http.HttpServlet"%>
<%@ page import="org.jfree.chart.*"%>
<%@ page import="org.jfree.chart.axis.*"%>
<%@ page import="org.jfree.chart.entity.*"%>
<%@ page import="org.jfree.data.general.*"%>
<%@ page import="org.jfree.chart.labels.*"%>
<%@ page import="org.jfree.chart.plot.*"%>
<%@ page import="org.jfree.chart.renderer.category.*"%>
<%@ page import="org.jfree.chart.urls.*"%>
<%@ page import="org.jfree.data.category.*"%>
<%@ page import="org.jfree.chart.plot.CategoryPlot"%>
<%@ page import="org.jfree.chart.renderer.category.BarRenderer"%>
<%@ page import="com.mongodb.BasicDBObject"%>
<%@ page import="com.mongodb.BulkWriteOperation"%>
<%@ page import="com.mongodb.BulkWriteResult"%>
<%@ page import=" com.mongodb.Cursor"%>
<%@ page import="com.mongodb.DB"%>
<%@ page import="com.mongodb.DBCollection"%>
<%@ page import="com.mongodb.DBCursor"%>
<%@ page import="com.mongodb.DBObject"%>
<%@ page import="com.mongodb.MongoClient"%>
<%@ page import="com.mongodb.ParallelScanOptions"%>
<%@ page import="com.mongodb.ServerAddress"%>
<%@ page import="java.net.UnknownHostException"%>

<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Opinion Mining</title>

<link href="css/bootstrap.min.css" rel="stylesheet">
<link href="css/datepicker3.css" rel="stylesheet">
<link href="css/styles.css" rel="stylesheet">

<!--Icons-->
<script src="js/lumino.glyphs.js"></script>

<!--[if lt IE 9]>
<script src="js/html5shiv.js"></script>
<script src="js/respond.min.js"></script>
<![endif]-->

</head>

<body>
	<nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
	<div class="container-fluid">
		<div class="navbar-header">

			<a class="navbar-brand" href="#"><span>Opinion</span>Mining</a> <br>
			<p align="right">
				<a href="logout.jsp">Logout</a>
			</p>
		</div>

	</div>
	<!-- /.container-fluid --> </nav>

	<form action="result1.jsp">
		<div class="row">
			<div class="col-xs-10 col-xs-offset-1 col-sm-8 col-sm-offset-2 col-md-4 col-md-offset-4">
				<div class="login-panel panel panel-default">
					<div class="panel-heading">Product Reviews for iPhone Plus 7</div>
					<div class="panel-body">
						<form role="form">
							<fieldset>
								<div class="form-group">
									<a href="https://www.google.com/url?sa=t&rct=j&q=&esrc=s&source=web&cd=1&cad=rja&uact=8&ved=0ahUKEwjOyJv1ud7QAhVOz2MKHXeoDIUQFghDMAA&url=https%3A%2F%2Fwww.cnet.com%2Fproducts%2Fapple-iphone-7-plus%2Freview%2F&usg=AFQjCNE1Dw1Za0qDvuXvshRWVOcAx3TCQw&bvm=bv.139782543,bs.1,d.cGc">CNET</a>
									<br> <a	href="https://www.google.com/url?sa=t&rct=j&q=&esrc=s&source=web&cd=2&cad=rja&uact=8&ved=0ahUKEwjOyJv1ud7QAhVOz2MKHXeoDIUQFghOMAE&url=http%3A%2F%2Fwww.techradar.com%2Freviews%2Fphones%2Fmobile-phones%2Fiphone-7-plus-1327948%2Freview&usg=AFQjCNF9oiCOeK_z8IQ2AbIS8T90bWpKmA&bvm=bv.139782543,bs.1,d.cGc">Tech
										Radar</a> <br> <a
										href="https://www.google.com/url?sa=t&rct=j&q=&esrc=s&source=web&cd=4&cad=rja&uact=8&ved=0ahUKEwjOyJv1ud7QAhVOz2MKHXeoDIUQFghdMAM&url=http%3A%2F%2Fwww.theverge.com%2Fa%2Fapple-iphone-7-review-vs-iphone-7-plus&usg=AFQjCNF8NrQ9ZjiQukkORZhBydW_UUpkHA&bvm=bv.139782543,bs.1,d.cGc">The
										Verge</a> <br> <a
										href="https://www.google.com/url?sa=t&rct=j&q=&esrc=s&source=web&cd=8&cad=rja&uact=8&ved=0ahUKEwjOyJv1ud7QAhVOz2MKHXeoDIUQFghxMAc&url=http%3A%2F%2Fwww.gsmarena.com%2Fapple_iphone_7_plus-review-1506.php&usg=AFQjCNFpDvdpGC56PhWj3lgRtuIbre1xVA&bvm=bv.139782543,bs.1,d.cGc">GSM
										Arena</a>

								</div>
							</fieldset>
						</form>
					</div>
				</div>
			</div>
			<!-- /.col-->
		</div>

	</form>
	<br>


	<div class="row">
		<div class="col-md-6">
			<div class="panel panel-default">
				<div class="panel-heading">Pie Chart</div>
				<div class="panel-body">
					<div class="canvas-wrapper">
						<canvas class="chart" id="pie-chart" height="303" width="606" style="width: 606px; height: 303px;"></canvas>
					</div>
				</div>
			</div>
		</div>
		<div class="col-md-6">
			<div class="panel panel-default">
				<div class="panel-heading">Doughnut Chart</div>
				<div class="panel-body">
					<div class="canvas-wrapper">
						<canvas class="chart" id="doughnut-chart" height="303" width="606" style="width: 606px; height: 303px;"></canvas>
					</div>
				</div>
			</div>
		</div>
	</div>


	<script src="js/jquery-1.11.1.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<script src="js/chart.min.js"></script>
	<script src="js/chart-data.js"></script>
	<script src="js/easypiechart.js"></script>
	<script src="js/easypiechart-data.js"></script>
	<script src="js/bootstrap-datepicker.js"></script>
	<script>
		!function ($) {
		    $(document).on("click","ul.nav li.parent > a > span.icon", function(){          
		        $(this).find('em:first').toggleClass("glyphicon-minus");      
		    }); 
		    $(".sidebar span.icon").find('em:first').addClass("glyphicon-plus");
		}(window.jQuery);

		$(window).on('resize', function () {
		  if ($(window).width() > 768) $('#sidebar-collapse').collapse('show')
		})
		$(window).on('resize', function () {
		  if ($(window).width() <= 767) $('#sidebar-collapse').collapse('hide')
		})
	</script>	


</body>
</html>