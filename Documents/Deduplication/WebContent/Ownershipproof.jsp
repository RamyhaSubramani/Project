<!DOCTYPE HTML>
<!-- Website template by freewebsitetemplates.com -->
<%@page import="java.util.*" %>
<%@page import="com.dbcon.*" %>
<%@page import="java.sql.*" %>
<html>
<head>
	<meta charset="UTF-8">
	<title>LOGIN</title>
	<link rel="stylesheet" href="css/styles.css" type="text/css" />
	<link rel="stylesheet" href="css/style1.css" type="text/css" media="all" /> <!-- Style-CSS --> 
<link rel="stylesheet" href="css/font-awesome.css"> <!-- Font-Awesome-Icons-CSS -->
<script type="text/javascript" src="js/jquery-2.1.4.min1.js"></script>
<link href="//fonts.googleapis.com/css?family=Oleo+Script:400,700&amp;subset=latin-ext" rel="stylesheet">
<!-- //online-fonts -->
</head>
<body>
<script src="js/jquery.vide.min1.js"></script>
	<div id="header">
		<div class="area">
			<div id="logo">
				<a href="index.html"><img src="images/123.png" alt="LOGO" height="86" width="170" /></a>
			</div>
			<ul id="navigation">
				
				
				<li>
					<a href="Deduplicate.jsp">BACK</a>
				</li>
				<li>
					<a href="Logout.jsp">LOGOUT</a>
				</li>
				<li>
					<a href="contact.html">CONTACT</a>
				</li>
			</ul>
		</div>
	</div>
	<br><br><br><br><br>
	
	
	<%
				String filename="";
			   
			    System.out.println("Keyyyyyyyyyy=="+filename);
			   
			    
			    String filekey="";
			    Connection con=Regdb.Connect();
			    
			  //  PreparedStatement ps=conn.prepareStatement("SELECT FileKey from `deypos`.`uploudfiles` where filename='"+Key+"'");
			  
			  PreparedStatement ps=con.prepareStatement("SELECT filename,filekey FROM `deduplication`.`fileupload`");
			  ResultSet rs  =ps.executeQuery();
			    	
			  

			  while(rs.next())
			  {
			   	filename=rs.getString(1);
			   	System.out.println(filename);
				  filekey=rs.getString(2);
				  System.out.println(filekey);
			  }
			%>
    
    <section id="error" class="container" style="font-size: 30px;">
        <h1 style="font-size: 50px;">Proof of Storage.....  </h1>
<!--         <p>Dynamic Proof of Storage (PoS) is a useful cryptographic primitive that enables a user to check the integrity of outsourced files and to efficiently update the files in a cloud server</p> -->
        <input   type="text" name="key"  value="<%=filekey%>" style="width: 300px; height:35px;">
        <a class="btn btn-success" href="MultiuserSuccess.jsp">GO TO THE PROOF OF STORAGE OWNERSHIP</a>
    </section>
	
	
	
	<br><br><br><br><br><br><br><br>
	<br><br><br><br><br><br>

	         
	
	<div id="footer">
		<span class="divider"></span>
		<div class="area">
			<div id="connect">
				
			</div>
			<p>
				A© 2017 AZ De-duplication. All Rights Reserved.
			</p>
		</div>
	</div>
</body>
</html>