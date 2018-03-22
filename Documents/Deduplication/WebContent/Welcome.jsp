<!DOCTYPE HTML>

<%@ page import="com.servlet.Login" %>
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
					<a href="fileupload.jsp">FILEUPLOAD</a>
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
	<br>
		
	<!-- <div id="contents">
		<div id="adbox">
			<div class="area"> -->
				
				
				<%String email=session.getAttribute("email").toString();%> 
	<marquee direction="left" style="font-size: 50px; text-shadow: 1px 1px 30px yellow,0 0 25px yellow,0 0 25px orange; "><h1>Welcome <%=email %></h1></marquee>
			<img  src="images/w1.jpg" style="width: 1000px; height: 600px;">
					
			<!-- </div>
		</div> -->
	
	
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