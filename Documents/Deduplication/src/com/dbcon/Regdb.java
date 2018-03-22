package com.dbcon;

import java.sql.Connection;
import java.sql.DriverManager;



public class Regdb {
 static Connection con=null;

public  static Connection Connect()  throws Exception
{
	System.out.println("data base connection;;;;;;;;;");
	Class.forName("com.mysql.jdbc.Driver");
	con=DriverManager.getConnection("jdbc:mysql://localhost:3306/deduplication","root","root");
	System.out.println("Datatbase Connected");
	return con;
	
}



}