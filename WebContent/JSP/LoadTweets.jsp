<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="espproject.*" %>
<%@ page import="java.util.*" %>
<%@ page import="java.nio.file.*" %>

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

				<a class="navbar-brand" href="AdminMenu.jsp"><span>Opinion</span>Mining</a> <br>
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
				<form action="LoadTweets.jsp" class="form-inline" method="POST">
					<div style="line-height: 3.4em;">
						<label for="purge tables">Product Name:</label> <input type="text" id="productname" name="productname" class="form-control" value=<%= request.getParameter("productname") == null ? "" : request.getParameter("productname") %>>
						<br/>
						 <input type="submit" value="Add Product" class="btn btn-primary"> 
					</div>
					<%
						String productname = request.getParameter("productname");							
						System.out.println("product name - " + productname);
						if (productname != null) {							
							callTwitterApi obj1=new callTwitterApi();
							SearchTweets tweetsLoaded = obj1.getTweetsUsingSearch(productname, getServletContext());
						
					%>
					
					<h3>Tweets Loaded in database</h3>
					<table class="table table-hover">
						<thead>
							<tr>
								<th>Tweet Ids</th>
								<th>Timezone</th>
								<th>Created At</th>
								<th>Retweet Count</th>
								<th>Favorite Count</th>
								<th>Score</th>
								<th>Text</th>
							</tr>
						</thead>
						<tbody>
						<%
						sentimentAnalysis calScore=new sentimentAnalysis();
						List<Status> statuses = tweetsLoaded.getStatuses();
						for(Status status : statuses)
						{
							double score=calScore.calSentimentScore(status.getText(),status.getRetweetCount().intValue() , status.getFavoriteCount().intValue(), getServletContext());
						%>
						
							<tr>
								<td><%= status.getId().toString() %></td>
								<td><%= status.getUser().getTimeZone() %></td>
								<td><%= status.getCreatedAt() %></td>
								<td><%= status.getRetweetCount() %></td>
								<td><%= status.getFavoriteCount() %></td>
								<td><%= score %></td>
								<td><%= status.getText() %></td>
							</tr>
							<%
						}
							%>
						</tbody>
					</table>
					
					
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

</body>
</html>

