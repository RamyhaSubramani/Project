<!DOCTYPE HTML>
<!-- Website template by freewebsitetemplates.com -->
<%@page import="java.util.*" %>
<%@page import="java.sql.*" %>
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
					<a href="Logout.jsp">LOGOUT</a>
				</li>
				<li>
					<a href="contact.html">CONTACT</a>
				</li>
			</ul>
		</div>
	</div>
	<br><br><br><br><br>
	<table border="20" >
<tr>
<td>
<h3>File OwnerEmail....</h3>


</td>
<td><h3>File Name......</h3>

</td>
<td>
<h3>File Upload Time.....</h3>

</td>
<!-- <td> -->
<!-- <h3>File Content.....</h3> -->

<!-- </td> -->
<td>
<h3>File Encrypted.....</h3>

</td>


</tr>
<tr>
<%
	String Ownername=null;
    String Filename=null;
     String Time=null;
     String Filekey=null;
     String Filecontent=null;
     Connection con=Regdb.Connect();
    PreparedStatement ps=con.prepareStatement("SELECT * FROM `deduplication`.`fileupload` ");
    ResultSet rs=ps.executeQuery();

    while(rs.next())
    {
     Ownername=rs.getString(8);
    	 Filename=rs.getString(1);
    	 Time=rs.getString(5);
    	 Filekey=rs.getString(7);
//     	 Filecontent=rs.getString(2);
%>
<td>

<%=Ownername %>

</td>
<td>
<%=Filename%>
</td>
<td>

<%=Time%>
</td>

<td>
<a href="Encryption success.jsp? file=<%=Filename%>"><button value="Encrypt">Encrypt File </button></a>
</td>


</tr>
<% }%>
</table>
	
	
	
	
	
	
	
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