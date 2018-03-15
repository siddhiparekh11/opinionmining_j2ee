package espproject;
import com.mongodb.BasicDBObject;
import com.mongodb.BulkWriteOperation;
import com.mongodb.BulkWriteResult;
import com.mongodb.Cursor;
import com.mongodb.DB;
import com.mongodb.DBCollection;
import com.mongodb.DBCursor;
import com.mongodb.DBObject;
import com.mongodb.MongoClient;
import com.mongodb.ParallelScanOptions;
import com.mongodb.ServerAddress;

import java.util.List;
import java.util.Set;

public class mongoConnect {
	
	// TODO Auto-generated method stub
	
	public static void insertMongoData(String tweetid,String timezone,String timestamp,int retweetcount, int favorited,double sentimentscore,String tweettext,String productname)
	{
				MongoClient mongoClient = new MongoClient( "localhost" , 27017 );
				DB db = mongoClient.getDB("espdb");
				DBCollection coll1 = db.getCollection("tweetstable");
			//System.out.println("Connected successfully");
				//System.out.println(coll1);
				BasicDBObject doc = new BasicDBObject("tweetid", tweetid)
				     .append("timezone", timezone)
				        .append("timestamp", timestamp).append("retweetcount", retweetcount).append("favorited", favorited).append("sentimentscore", sentimentscore).append("tweettext", tweettext).append("productname", productname);
				coll1.insert(doc);
				mongoClient.close();
				       
				        //System.out.println("Inserted successfully");
	}
	public static void insertMongoData1(String productName,String rEview1,String rEview2,String rEview3,String rEview4)
	{
				MongoClient mongoClient = new MongoClient( "localhost" , 27017 );
				DB db = mongoClient.getDB("espdb");
				DBCollection coll1 = db.getCollection("products");
			//System.out.println("Connected successfully");
				//System.out.println(coll1);
				BasicDBObject doc = new BasicDBObject("productname", productName)
				     .append("present", false)
				        .append("review1", rEview1).append("review2", rEview2).append("review3", rEview3).append("review4", rEview4);
				coll1.insert(doc);
				mongoClient.close();
				       
				        //System.out.println("Inserted successfully");
	}
	
	
//	public static String returnMongoData()
//	{
//		String retTweet="Hello";
//		MongoClient mongoClient = new MongoClient( "localhost" , 27017 );
//		DB db = mongoClient.getDB("espdb");
//		DBCollection coll1 = db.getCollection("tweetstable");
//		DBCursor cursor = coll1.find();
//		DBObject tempobj;
//		double realScore=0;
//		sentimentAnalysis s=new sentimentAnalysis();
//		while(cursor.hasNext()) {
//			tempobj=cursor.next();
//			realScore=s.calSentimentScore(tempobj.get("tweettext").toString(),Integer.valueOf(tempobj.get("retweetcount").toString()),Integer.valueOf(tempobj.get("favorited").toString()));
//		   // System.out.println(cursor.next());
//		}
//		
//		mongoClient.close();
//		return retTweet;
//	}
	
	

}
