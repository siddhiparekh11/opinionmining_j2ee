
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
<%@ page import="java.util.List"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">


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
					<a href="AdminLogout.jsp">Logout</a>
				</p>
			</div>
		</div>
		<!-- /.container-fluid -->
	</nav>

	<br />
	<br />
	<br />
	<div class="col-sm-2"></div>
	<div class="col-sm-8">

		<div class="panel panel-primary">
			<div class="panel-heading">
				<center>
					<%
						if ((session.getAttribute("userid") == null) || (session.getAttribute("userid") == "")) {
					%>
							You are not logged in<br /> <a href="AdminLogin.jsp">Please Login</a>
				</center>
			</div>
					<%
						} else {
					%>
					Welcome	<%=session.getAttribute("userid")%>
					
					
					
				</center>
			</div>
			<div class="panel-body">
				<br>
				<form action="UsageStatistics.jsp" class="form-inline" method="POST">
					<input type="hidden" name="s"/>
					<div style="line-height: 3.4em;">
<div class="form-group">
							<label>Select product : </label>
							<%
								MongoClient mongoClient = new MongoClient("localhost", 27017);
								DB db = mongoClient.getDB("espdb");
								DBCollection coll1 = db.getCollection("tweetstable");

								List<String> Products = coll1.distinct("productname");
							%>
							<select name="product_name" class="form-control">
								<%
									for (String temp : Products) {
								%>
								<option value="<%=temp%>"><%=temp%></option>

								<%
									}
								%>
							</select>
							<%
								mongoClient.close();
							%>
							
						 <input type="submit" value="See Usage Statistics" class="btn btn-primary"> 
						</div>
					</div>
					
					<br/><br/>
					<%
						if(request.getParameter("s") != null) {
					%>
					<div class="canvas-wrapper">
						<canvas class="main-chart" id="bar-chart" height="200" width="600"></canvas>
					</div>
					<%
						}
					%>
				</form>
			</div>
	
			<%
			}
		%>
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

