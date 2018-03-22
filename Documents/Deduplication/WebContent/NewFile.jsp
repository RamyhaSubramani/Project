<!DOCTYPE HTML>
<%@page import="java.util.*" %>
<%@page import="java.sql.*" %>
<%@page import="com.dbcon.*" %>
<%@page import="javax.servlet.http.HttpSession" %>


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
				
				<li >
					<a href="monitoring.jsp">MONITORING</a>
				</li>
				<li >
					<a href="Logout.jsp">LOGOUT</a>
				</li>
				<li>
					<a href="contact.html">CONTACT</a>
				</li>
			</ul>
		</div>
	</div>
	


<table border="10"  >
<tr>
			<td> 
				<h3>File Name......</h3>

		</td> 
			<td> 
			<h3>Owner name......</h3> 

			</td> 
 			<td><h3>Public Key........</h3></td>
			
			<td> 
				<h3> File Request......</h3> 

 			</td> 
 			
	</tr> 
	
<%







String filekey=null;

	String Ownername=null;
    String filename1=null;
     String Time=null;
     String privatekey1=null;
     Connection con=Regdb.Connect();
    PreparedStatement ps=con.prepareStatement("SELECT * FROM deduplication.request_file r");
    ResultSet rs=ps.executeQuery();

    while(rs.next())
    {

    	filename1=rs.getString(1);
    	 privatekey1=rs.getString(2);
    	Ownername=rs.getString(3);
%>
<tr>
<td>
<%=Ownername%>
</td>
<td>

<%=filename1 %>

</td>
<td>
<%=privatekey1%>
</td>
<!-- <td><a href="Accept1.jsp"><button >Access</button></a></td> -->


<td><a href="Access?filename=<%=rs.getString(1) %>&&filekey=<%=rs.getString(2) %>&&Ownername=<%=rs.getString(3) %>&&filerequest=<%=rs.getString(4)%>"><button>Allow</button></a></td>



</tr>
<% }%>
</table>
	 	
			<br><br><br><br><br>
			<br><br><br><br><br><br><br>
			<br><br><br><br><br><br><br><br>
	  
	<div id="footer">
		<span class="divider"></span>
		<div class="area">
			<div id="connect">
				+6
			</div>
			<p>
				A© 2017 AZ De-duplication. All Rights Reserved.
			</p>
		</div>
	</div>
</body>
</html>