<!DOCTYPE HTML>
<!-- Website template by freewebsitetemplates.com -->
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.*"%>
<%@page import="com.dbcon.*" %>
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
<style>

table {
    font-family: arial, sans-serif;
    border-collapse: collapse;
    width: 100%;
}

td, th {
    border: 1px solid #dddddd;
    text-align: left;
    padding: 8px;
}

tr:nth-child(even) {
    background-color: #dddddd;
}
</style>
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
					<a href="fileupload.jsp">BACK</a>
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
	<br>
	<section class="title">
    <div class="container">
      <div class="row-fluid">
        <div class="span6">
          <h1 style="font-size: 40px;">File Owners and All Files</h1>
        </div>
        <div class="span6">
          <ul class="breadcrumb pull-right">
            
          </ul>
        </div>
      </div>
     
    </div>
    <%
    	String Filename=request.getParameter("key");
    System.out.println("Filename===="+Filename);
        String Ownername=null;
        
         String Time=null;
         String Content=null;
         Connection con=Regdb.Connect();
        
         PreparedStatement ps=con.prepareStatement("SELECT * FROM `deduplication`.`fileupload` where FileKey='"+Filename+"'");
        ResultSet rs=ps.executeQuery();
         
         
        while(rs.next())
        {
         
        	 Content=rs.getString(2);
        }
    %>
  
	 
  </section>
  <!-- / .title -->       

  <!-- Career -->
  <section id="career" class="container"> 
    <div class="center"></div>
       </div>
    <hr>
    
    
<table border="5">



    
    
</table>
    <div class="row-fluid">
      <!-- Left Column -->
      <div class="span6">
       

     </div>
     <!-- /Left Column -->

     <!-- Right Column -->
     <div class="span6">
      

   </div>
   <!-- /Right Column -->

 
 <p>&nbsp;</p>
<textarea  rows="10" cols="10" style="width: 400px;"> <%=Content %></textarea>
</section>
	
	
	
	
	
	<br><br><br><br><br><br>
	<br><br>
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