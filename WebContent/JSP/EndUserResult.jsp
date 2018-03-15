
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">

<%@ page import="java.awt.*"%>
<%@ page import="java.io.*"%>
<%@ page import="java.util.*"%>
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
<%
System.out.println(" I am here -1	");
%>
<body>
	<nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
	<div class="container-fluid">
		<div class="navbar-header">

			<a class="navbar-brand" href="EndUserLoginSuccess.jsp"><span>Opinion</span>Mining</a> <br>
			<p align="right">
				<a href="EndUserLogout.jsp">Logout</a>
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
									
			

			<% MongoClient mongoClient = new MongoClient("localhost", 27017);
			DB db = mongoClient.getDB("espdb");
			DBCollection coll1 = db.getCollection("products"); 
			
			BasicDBObject whereQuery = new BasicDBObject();
			whereQuery.put("productname", request.getParameter("product_name"));
			DBObject tempobj = coll1.findOne(whereQuery); %>
			
			  <a href="<%=tempobj.get("review1").toString() %>">Review1</a>
			  <br/>
				<a href="<%=tempobj.get("review2").toString()%>">Review2</a>
				<br/>
				<a href="<%=tempobj.get("review3").toString()%>">Review3</a>
				<br/>
				<a href="<%=tempobj.get("review4").toString()%>">Review4</a>
				<% 
				
			
			
			mongoClient.close();
		%> 

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

	<%
	
		String productName = request.getParameter("product_name");
		System.out.println("Product name - " + productName);

		double scoreZero = 0;
		double scorePos = 0;
		double scoreNeg = 0;
		 mongoClient = new MongoClient("localhost", 27017);

		db = mongoClient.getDB("espdb");
		 coll1 = db.getCollection("tweetstable");
		//BasicDBObject whereQuery = new BasicDBObject();
		//whereQuery.put("sentimentscore", 0);
		
		BasicDBObject andQuery = new BasicDBObject();
		ArrayList<BasicDBObject> obj = new ArrayList<BasicDBObject>();
		obj.add(new BasicDBObject("sentimentscore", 0));
		obj.add(new BasicDBObject("productname", productName));
		andQuery.put("$and", obj);

		
		DBCursor cursor = coll1.find(andQuery);
		while (cursor.hasNext()) {
			DBObject theObj = cursor.next();
			scoreZero = scoreZero + 1;		
		}
		
		System.out.println("Product Name " + productName + " ScoreZero - " + scoreZero);

		//BasicDBObject whereQuery2 = new BasicDBObject();
		//whereQuery2.put("sentimentscore", new BasicDBObject("$gt", 0));
		
		BasicDBObject andQuery2 = new BasicDBObject();
		ArrayList<BasicDBObject> obj2 = new ArrayList<BasicDBObject>();
		obj2.add(new BasicDBObject("sentimentscore", new BasicDBObject("$gt", 0)));
		obj2.add(new BasicDBObject("productname", productName));
		andQuery2.put("$and", obj2);
		
		DBCursor cursor2 = coll1.find(andQuery2);
		while (cursor2.hasNext()) {
			DBObject theObj = cursor2.next();
			scorePos = scorePos + 1;
		}
		
		System.out.println("Product Name " + productName + " scorePos - " + scorePos);
		
		//BasicDBObject whereQuery3 = new BasicDBObject();
		//whereQuery3.put("sentimentscore", new BasicDBObject("$lt", 0));
		BasicDBObject andQuery3 = new BasicDBObject();
		ArrayList<BasicDBObject> obj3 = new ArrayList<BasicDBObject>();
		obj3.add(new BasicDBObject("sentimentscore", new BasicDBObject("$lt", 0)));
		obj3.add(new BasicDBObject("productname", productName));
		andQuery3.put("$and", obj2);		
		
		DBCursor cursor3 = coll1.find(andQuery3);
		while (cursor3.hasNext()) {
			DBObject theObj = cursor3.next();
			scoreNeg = scoreNeg + 1;
		}
		
		System.out.println("Product Name " + productName + " scoreNeg - " + scoreNeg);
		
		final DefaultPieDataset data1 = new DefaultPieDataset();
		data1.setValue("Positive", new Double(scorePos));
		data1.setValue("Negative", new Double(scoreNeg));
		data1.setValue("Neutral", new Double(scoreZero));

		JFreeChart chart = ChartFactory.createPieChart("Global View ", data1, true, true, false);

		try {
			final ChartRenderingInfo info = new ChartRenderingInfo(new StandardEntityCollection());
			System.out.println(getServletContext().getRealPath("/JSP") + "/piechart.jpeg");
			final File file1 = new File(getServletContext().getRealPath("/JSP") + "/piechart.jpeg");
			ChartUtilities.saveChartAsPNG(file1, chart, 600, 400, info);
		} catch (Exception e) {
			out.println(e);
		}
	%>


	<%
		final double[][] data = new double[][] { { scorePos, scoreNeg, scoreZero } };

		final CategoryDataset dataset = DatasetUtilities.createCategoryDataset("Variation in Reviews ", "", data);

		JFreeChart chart1 = null;
		BarRenderer renderer = null;
		CategoryPlot plot = null;

		final CategoryAxis categoryAxis = new CategoryAxis("Reviews");
		final ValueAxis valueAxis = new NumberAxis("Percentage");
		renderer = new BarRenderer();

		plot = new CategoryPlot(dataset, categoryAxis, valueAxis, renderer);
		plot.setOrientation(PlotOrientation.VERTICAL);
		chart1 = new JFreeChart("Global View", JFreeChart.DEFAULT_TITLE_FONT, plot, true);

		chart1.setBackgroundPaint(new Color(255, 255, 255));

		try {
			final ChartRenderingInfo info = new ChartRenderingInfo(new StandardEntityCollection());
			final File file2 = new File(getServletContext().getRealPath("/JSP") + "/barchart.jpeg");
			ChartUtilities.saveChartAsPNG(file2, chart1, 600, 400, info);
		} catch (Exception e) {
			out.println(e);
		}
	%>
	<center>
		<IMG SRC="piechart.jpeg" WIDTH="600" HEIGHT="400" BORDER="0" USEMAP="#chart"> <IMG SRC="barchart.jpeg" WIDTH="600" HEIGHT="400" BORDER="0" USEMAP="#chart">
	</center>

</body>
</html>