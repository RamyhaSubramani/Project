package com.imple;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;



import com.bean.AccessBean1;
import com.bean.Filebean;
import com.bean.Regbean;
import com.bean.Request;


import com.dbcon.Regdb;



import com.inter.Reginter;
import com.servlet.Login;

public class Regimple implements  Reginter{
	Connection con;
	PreparedStatement ps;
	String filekey="";
	
	@Override
	public int register(Regbean rb) {
		int result=0;      
		try {
			Connection con=Regdb.Connect();
			PreparedStatement ps=con.prepareStatement("INSERT INTO deduplication.register VALUES(?,?,?,?,?)");
			
			ps.setString(1, rb.getUsername());
			ps.setString(2, rb.getEmail());
			ps.setString(3, rb.getPassword());
			ps.setString(4, rb.getConfirmpassword());
			ps.setString(5, rb.getMobile());
			
		result=ps.executeUpdate();
			
		} catch (Exception e) {
			
			e.printStackTrace();
		}
		return result;
	}

	@Override
	public boolean login(Regbean Lb) {
		boolean log=false;
		try {
			
		
		
		Connection con=Regdb.Connect();
		PreparedStatement ps=con.prepareStatement("SELECT * FROM deduplication.register  where Email=? and password=?");
		
		ps.setString(1, Lb.getEmail());
		ps.setString(2, Lb.getPassword());
		
		ResultSet res=ps.executeQuery();
		log=res.next();
		
		
		} catch (Exception e) {
			e.printStackTrace();
		}
		return log;
		
	}

	

public int Fileinsert(Filebean fb) {

	int res=0;
	try {
		Connection con=Regdb.Connect();
		
		
	
		DateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
		   
		   Date date = new Date();
		   System.out.println(dateFormat.format(date));
		PreparedStatement ps;  
		ps=con.prepareStatement("INSERT INTO deduplication.fileupload VALUES(?,?,?,?,?,?,?,?)");
		
		ps.setString(1, fb.getFilename());
		ps.setString(2, fb.getFilecontent());
		ps.setString(3, fb.getEncryptcontent());
		ps.setString(4, fb.getFilepath());
		ps.setString(5, dateFormat.format(date));
		ps.setString(6, fb.getFiletype());
		System.out.println("Filetypes......"+fb.getFiletype());
		
		filekey=fb.getFilekey();
		ps.setString(7, fb.getFilekey());                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   
		ps.setString(8, fb.getEmail());
		
		res=ps.executeUpdate();
		
	} catch (Exception e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	
	
	return res;
}

@Override
public int getrequest(Request dd) 
	{
	System.out.println("get request");
	int i=0;
		
		try
		{
			con=(Connection) Regdb.Connect();
	        ps=con.prepareStatement("INSERT INTO deduplication.request_file VALUES(?,?,?,?)");
	        
			ps.setString(1,dd.getFilename());
			ps.setString(2,"********");
			ps.setString(3,dd.getEmail());
			
			ps.setString(4,"Not Update");
			
			i=ps.executeUpdate();	
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return i;
		}

@Override
public int getaccess(AccessBean1 as) {
	// TODO Auto-generated method stub
 
	int i=0;
	try
	
	{
		con = (Connection) Regdb.Connect();
		System.out.println("fdfsdf");
	 ps = con.prepareStatement("UPDATE deduplication.request_file r SET Filerequest1='Update' where  filename1='"+as.getFilename()+"' and Ownername='"+as.getEmail()+"'");
		
		System.out.println("The Result is"+ps);
		
		i=ps.executeUpdate();
		
		System.out.println("The i="+i);
	}
	catch(Exception e)
	{
		e.printStackTrace();
	}
	
	return i;
	
}

@Override
public String getfilekey(String Filename) {
	// TODO Auto-generated method stub
	
int i=0;
	String PrivateKey = null;
		
		try
		{
			 con = (Connection) Regdb.Connect();
			ps=con.prepareStatement("SELECT filekey FROM `deduplication`.`fileupload` where  Filename='"+Filename+"'");
			
		    ResultSet rs =ps.executeQuery();
		    
		    while(rs.next())
		    {
		    	PrivateKey =rs.getString(1);
		    		
		    	System.out.println("PrivateKey="+PrivateKey);
		    }
			
			System.out.println("The i="+i);
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		
		return PrivateKey;
	}



}