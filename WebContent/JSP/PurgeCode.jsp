<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
   String productName = request.getParameter("product_name");
	MongoClient mongoClient = new MongoClient("localhost", 27017);

	DB db = mongoClient.getDB("espdb");
	DBCollection coll1 = db.getCollection("tweetstable");
	
	Calendar cal = Calendar.getInstance();
	cal.set(Calendar.HOUR, 0);
	cal.set(Calendar.MINUTE, 0);
	cal.set(Calendar.SECOND, 0);
	
	BasicDBObject andQuery = new BasicDBObject();
	ArrayList<BasicDBObject> obj = new ArrayList<BasicDBObject>();
	//obj.add(new BasicDBObject("timestamp", new BasicDBObject("$lt", cal.getTime())));
	obj.add(new BasicDBObject("productname", productName));
	
	andQuery.put("$and", obj);
	coll1.remove(andQuery);
	mongoClient.close();
	
	response.sendRedirect("PurgeTable.jsp?s=t");
%>