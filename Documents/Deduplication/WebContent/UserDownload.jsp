<!DOCTYPE HTML>
<%@page import="com.bean.Regbean"%>
<%@ page import="com.dbcon.*" %>
<%@ page import="java.util.*" %>
<%@ page import="java.sql.*" %>

<!-- Website template by freewebsitetemplates.com -->
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
					<a href="Login.jsp">BACK</a>
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
	
	
    
    <center>
<table border="10" >
<tr>

<td><h3 style="font-size: 30px;" >File Name......</h3>


</td>
<td>
<h3 style="font-size: 30px;">File View.....</h3>

</td>
<td>
<h3 style="font-size: 30px;">File Download.....</h3>

</td>
</tr>
<tr>
<%
	String Ownername=null;
    String Filekey=null;
    String Filename=null;
     String date=null;
     String Filecontent=null;
     Connection con=Regdb.Connect();
    
    PreparedStatement ps=con.prepareStatement("SELECT * FROM deduplication.fileupload  ");
    ResultSet rs=ps.executeQuery();

    while(rs.next())
    {
     Ownername=rs.getString(7); 
     Filename=rs.getString(1);
    	 Filekey=rs.getString(6);
    	 date=rs.getString(4);
    	 Filecontent=rs.getString(2);
%>

<td>
<%=Filename%>
</td>
<td>
<form action="ownerproofkey.jsp" >
<button onclick="my()">View File</button>

</form>
</td>
<td>

<%-- //<form action="Download?filename=<%=Filekey %>" method="post"> --%>
<form action="UserkeyDownload.jsp" method="post">

<button >Download</button>

</form>
</td>

</tr>
<% }%>
</table>
</center>
    <hr>

    <div class="row-fluid">
      <!-- Left Column -->
      <div class="span6">
       

     </div>
     <!-- /Left Column -->

     <!-- Right Column -->
     <div class="span6">
      

   </div>
   <!-- /Right Column -->

 </div>
 <p>&nbsp;</p>

</section>
	
	
	
	
	
	
	<br><br><br><br><br><br>
	<br><br><br><br><br><br>
	<br><br><br>
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