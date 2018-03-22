<!DOCTYPE HTML>
<!-- Website template by freewebsitetemplates.com -->
<%@page import="com.itextpdf.text.log.SysoCounter"%>
<%@page import="com.sun.corba.se.spi.orbutil.fsm.Guard.Result"%>
<%@page import="java.util.*"%>
<%@page import="java.sql.*"%>
<%@page import="com.dbcon.Regdb"%>
<html>
<head>
<meta charset="UTF-8">
<title>LOGIN</title>
<link rel="stylesheet" href="css/styles.css" type="text/css" />
<link rel="stylesheet" href="css/style1.css" type="text/css" media="all" />
<!-- Style-CSS -->
<link rel="stylesheet" href="css/font-awesome.css">
<!-- Font-Awesome-Icons-CSS -->
<script type="text/javascript" src="js/jquery-2.1.4.min1.js"></script>
<link
	href="//fonts.googleapis.com/css?family=Oleo+Script:400,700&amp;subset=latin-ext"
	rel="stylesheet">
<!-- //online-fonts -->
<style>
table {
	font-family: arial, sans-serif;
	border-collapse: collapse;
	width: 100%;
}

td,th {
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
				<a href="index.html"><img src="images/123.png" alt="LOGO"
					height="86" width="170" /></a>
			</div>
			<ul id="navigation">


				<li><a href="Login.jsp">BACK</a></li>
				<li><a href="Logout.jsp">LOGOUT</a></li>
				<li><a href="contact.html">CONTACT</a></li>
			</ul>
		</div>
	</div>
	<br>
	<table border="10">
		<tr>
			<td>
				<h3>File Name......</h3>


			</td>
			<td>
				<h3>Owner name......</h3>

			</td>
			<td><h3>Public Key........</h3></td>
			<td>
				<h3>Request Access......</h3>

			</td>
			<td>
				<h3>Downloads......</h3>

			</td>
		</tr>
		<tr>
			<%
String email=request.getSession().getAttribute("email").toString();
String filekey=null;
	String Ownername=null;
    String Filename=null;
     String Time=null;
     String password=null;
     Connection con=Regdb.Connect();
     
     System.out.println("email rajjjesh============================="+email);
    PreparedStatement ps=con.prepareStatement("SELECT * FROM deduplication.fileupload where Ownername!='"+email+"'");
    ResultSet rs=ps.executeQuery();

    while(rs.next())
    {

    	Filename=rs.getString(1);
    	Ownername=rs.getString(8);
   	 filekey=rs.getString(7);
    
%>
		</tr>
		<td><%=Filename %></td>
		<td><%=Ownername %></td>



		<%
    
	
	
	
		
		
			PreparedStatement ps2=con.prepareStatement("SELECT * FROM `deduplication`.`request_file` where filerequest1='Update' and Filename1='"+Filename+"' and Ownername='"+email+"'");
			
			
			ResultSet rs2 =ps2.executeQuery();
			
			boolean b =rs2.next();
			
			System.out.println(" b ="+b);
			
			if(b == true)
			{
			
			%>
		<td><%= rs.getString(7) %></td>
		<% 
			}
			else
			{
				%>

		<td><%="************" %></td>

		<%
			} 
	      %>

		<td><a
			href="requestfile?filename=<%=Filename%>&&privatekey=<%=filekey%>"
			onclick="alertName()"><button>Request</button></a></td>


		<td><a
			href="Download?filename=<%=Filename%>&&filekey=<%=filekey%>"><button>Download</button></a></td>

		<!-- <td> -->

		<%-- <%=Time%> --%>
		<!-- </td> -->

		</tr>


		<%}%>
		                                  

	</table> 







	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<div id="footer">
		<span class="divider"></span>
		<div class="area">
			<div id="connect"></div>
			<p>A© 2017 AZ De-duplication. All Rights Reserved.</p>
		</div>
	</div>


</body>
</html>