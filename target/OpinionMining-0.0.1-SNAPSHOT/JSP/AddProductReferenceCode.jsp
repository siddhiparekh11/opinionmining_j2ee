<%@page import="javax.xml.ws.Response"%>
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
<%
MongoClient mongoClient = new MongoClient( "localhost" , 27017 );
DB db = mongoClient.getDB("espdb");
DBCollection coll1 = db.getCollection("products");

BasicDBObject searchQuery = new BasicDBObject().append("productname", request.getParameter("product_name"));


BasicDBObject doc = new BasicDBObject();
     doc.append("present", true)
        .append("review1", request.getParameter("review1")).append("review2", request.getParameter("review2")).append("review3", request.getParameter("review3")).append("review4", request.getParameter("review4"));
BasicDBObject newDocument = new BasicDBObject();
newDocument.append("$set",doc);


coll1.update(searchQuery, newDocument);
mongoClient.close();
response.sendRedirect("AddProductReference.jsp");

%>