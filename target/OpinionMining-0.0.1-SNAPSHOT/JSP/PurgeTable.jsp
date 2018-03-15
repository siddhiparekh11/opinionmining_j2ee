
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

	<div class="col-xs-10 col-xs-offset-1 col-sm-8 col-sm-offset-2 col-md-4 col-md-offset-4">
		<div class="panel panel-primary">
			<div class="panel-heading">
				<center>
					<%
						if ((session.getAttribute("userid") == null) || (session.getAttribute("userid") == "")) {
					%>
					You are not logged in<br /> <a href="AdminLogin.jsp"><br>Please Login</a>
					<%
						} else {
					%>
					Welcome
					<%=session.getAttribute("userid")%>
					<%
						}
					%>
				</center>
			</div>
			<div class="panel-body">
				<form action="PurgeCode.jsp" method="POST">
					<br>
					<tr>
						<div class="form-group">
							<label>Select product you want to purge tweets for</label>
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
							
							
						</div>
						<td><br> <input type="submit" value="Purge" class="btn btn-primary"></td>
					</tr>
				</form>
			</div>
			<%
			if(request.getParameter("s") != null) {
			%>
			<div class="alert alert-success">
			  <strong>Success!</strong> data purged successfully.
			</div>
			<%
			}
			%>

		</div>

	</div>
	</br>




</body>
</html>