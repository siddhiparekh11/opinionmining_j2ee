

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
				<a class="navbar-brand" href="#"><span>Opinion</span>Mining</a>
			</div>
		</div>
		<!-- /.container-fluid -->
	</nav>
	<br>

	<center>
		<%
			String userid = request.getParameter("uname");
			String pwd = request.getParameter("pass");

			MongoClient mongoClient = new MongoClient("localhost", 27017);
			DB db = mongoClient.getDB("espdb");
			DBCollection coll1 = db.getCollection("users");
			BasicDBObject whereQuery = new BasicDBObject();
			whereQuery.put("uname", userid);
			DBCursor cursor = coll1.find(whereQuery);
			DBObject tempobj;
			if (cursor.hasNext()) {
				session.setAttribute("userid", userid);
				response.sendRedirect("EndUserLoginSuccess.jsp");
			} else {
				out.println("Invalid username or password entered <a href='EndUserLogin.jsp'>try again</a>");

			}

			mongoClient.close();
		%>

	</center>

</body>

</html>