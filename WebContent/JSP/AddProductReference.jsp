<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
<%@ page import="java.util.List" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Opinion Mining</title>

<link href="css/bootstrap.min.css" rel="stylesheet">
<link href="css/datepicker3.css" rel="stylesheet">
<link href="css/styles.css" rel="stylesheet">

<!--[if lt IE 9]>
<script src="js/html5shiv.js"></script>
<script src="js/respond.min.js"></script>
<![endif]-->

</head>

<body>
    <nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
		<div class="container-fluid">
			<div class="navbar-header">
				
				<a class="navbar-brand" href="AdminMenu.jsp"><span>Opinion</span>Mining</a>
                                <br>
				<p align="right">
  <a href="AdminLogout.jsp">Logout</a>
</p>	
			</div>
							
		</div><!-- /.container-fluid -->
	</nav>
    <form method="post" action="AddProductReferenceCode.jsp">
        <br>
        <br>
	<div class="row">
		<div class="col-xs-10 col-xs-offset-1 col-sm-8 col-sm-offset-2 col-md-4 col-md-offset-4">
			<div class="login-panel panel panel-default">
				<div class="panel-heading">Enter product details</div>
				<div class="panel-body">
					<form role="form">
						<fieldset>
							<div class="form-group">
							<label>Products</label>
		<%
			

			MongoClient mongoClient = new MongoClient("localhost", 27017);
			DB db = mongoClient.getDB("espdb");
			DBCollection coll1 = db.getCollection("products");
			
		//List<String> Products = coll1.distinct("productname"); %>
			<select name="product_name" class="form-control">
			 
               
			<%
			BasicDBObject whereQuery = new BasicDBObject();
			whereQuery.put("present", false);
			DBCursor cursor = coll1.find(whereQuery);
			//DBCursor cursor = coll1.find();
			DBObject tempobj=null;
			String temp;
			
			while(cursor.hasNext()) { %>
			
			
				<% tempobj=cursor.next();
				temp=tempobj.get("productname").toString();
				%>
				<option value="<%=temp%>"><%=temp%></option>
				
			<%}
			
			mongoClient.close();
		%> 
							
			</select>					
								
							
						</div>
                                                    <div class="form-group">
                                                            <label>Review 1</label>
								<input class="form-control" name="review1" type="text" value="">
							</div>
                                                    <div class="form-group">
                                                            <label>Review 2</label>
								<input class="form-control" name="review2" type="text" value="">
							</div>
                                                    <div class="form-group">
                                                            <label>Review 3</label>
								<input class="form-control" name="review3" type="text" value="">
							</div>
                                                    <div class="form-group">
                                                            <label>Review 4</label>
								<input class="form-control" name="review4" type="text" value="">
							</div>
                                                    
                                                    
							
                                                    
                                                    <input type="submit" value="Add References" class="btn btn-primary">     
                                                   
                                                    
						</fieldset>
                                            <br>
                                            
                       
                    
					</form>
				</div>
			</div>
		</div><!-- /.col-->
	</div>
    	
    </form>
		

	
</body>

</html>