

<%@ page import ="java.sql.*" %>
<%@ page import="com.mongodb.*"%>
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
<%@ page import="java.util.*"%>
<%
    String user = request.getParameter("uname");    
    String pwd = request.getParameter("pass");
    String fname = request.getParameter("fname");
    String lname = request.getParameter("lname");
    String email = request.getParameter("email");
    MongoClient mongoClient = new MongoClient( "localhost" , 27017 );
	DB db = mongoClient.getDB("espdb");
	DBCollection coll1 = db.getCollection("users");
//System.out.println("Connected successfully");
	//System.out.println(coll1);
	BasicDBObject doc = new BasicDBObject("firstname", fname)
	     .append("lastname", lname)
	        .append("email", email).append("uname", user).append("pass", pwd).append("role","user" );
	coll1.insert(doc);
	mongoClient.close();
	response.sendRedirect("EndUserRegistration.jsp");
%>
