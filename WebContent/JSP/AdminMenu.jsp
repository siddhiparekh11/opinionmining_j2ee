

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
					You are not logged in<br /> <a href="AdminLogin.jsp">Please Login</a>
					<%
						} else {
					%>
					Welcome
					<%=session.getAttribute("userid")%>

				</center>
			</div>
			<div class="panel-body">
				<br>
				<tr>
					<td>
						<form action="result1.jsp">
							<div style="line-height: 3.4em;">
								<center>
									<a class="btn btn-large btn-primary" href="LoadTweets.jsp">Load Tweets</a>
								</center>
								<br/>
								<center>
									<a class="btn btn-large btn-primary" href="PurgeTable.jsp">Purge</a>
								</center>
								<br/>
								<center>
									<a class="btn btn-large btn-primary" href="AddProductReference.jsp">Add Product Reviews</a>
								</center>
								<br/>
								<center>
									<a class="btn btn-large btn-primary" href="UsageStatistics.jsp">See Usage Statistics</a>
								</center>
								
							</div>
						</form>
					</td>
				</tr>
			</div>
					<%
						}
					%>			
		</div>
	</div>

</body>
</html>
