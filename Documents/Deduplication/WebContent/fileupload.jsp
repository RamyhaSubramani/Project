<!DOCTYPE HTML>

<%@ page import="com.servlet.Login" %>
<%@ page import="java.util.*" %>
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
<style type="text/css" >
.container {
    overflow: hidden;
    background-color: #333;
    font-family: Arial;
}

.container a {
    float: left;
    font-size: 16px;
    color: white;
    text-align: center;
    padding: 14px 16px;
    text-decoration: none;
}

.dropdown {
    float: left;
    overflow: hidden;
}

.dropdown .dropbtn {
    font-size: 16px;    
    border: none;
    outline: none;
    color: white;
    padding: 14px 16px;
    background-color: inherit;
}

.container a:hover, .dropdown:hover .dropbtn {
    background-color:  #33cc33;
}

.dropdown-content {
    display: none;
    position: absolute;
    background-color: #f9f9f9;
    min-width: 160px;
    box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
    z-index: 1;
}

.dropdown-content a {
    float: none;
    color: black;
    padding: 12px 16px;
    text-decoration: none;
    display: block;
    text-align: left;
}

.dropdown-content a:hover {
    background-color: #ddd;
}

.dropdown:hover .dropdown-content {
    display: block;
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
				
			<div class="container">
					
					<div class="dropdown">
						<button class="dropbtn">CLOUD STORAGE</button>
						<div class="dropdown-content">
							<a href="fileshow.jsp">FILE SHOW</a>
							<a href="private.jsp">PRIVATE KEY</a>
							<a href="publickey.jsp">PUBLIC KEY</a>
<!-- 							 <a href="UserDownload.jsp">DOWNLOAD</a>  -->
							 
						</div>
					</div>
					
							<a href="Logout.jsp">LOGOUT</a>
					<a href="contact.html">CONTACT</a>
				</div>
			</ul>
		</div>
	</div>
	<br>
	<% String email=session.getAttribute("email").toString();
	
	System.out.println("email==========="+email);
	
	
	%>
	
	
			<!--Item 1-->
			
				<!--             // -->
				
				<h1 style="font-size: 50px; text-shadow: 1px 1px 30px yellow,0 0 25px yellow,0 0 25px orange; " align="center"  >File Upload here?</h1>
				
				
				<br> 
				<form action="Fileupload" method="post" enctype="multipart/form-data">	
				<img src="images/process.gif" width="325" height="325" align="left">
				<img src="images/process.gif" width="325" height="325" align="right">
				<br><br><br>
				
				<%Random r= new Random(); 
				
				String key="ABCDEF123456789*&%";
				char c=key.charAt(r.nextInt(key.length()));
				char c1=key.charAt(r.nextInt(key.length()));
				char c2=key.charAt(r.nextInt(key.length()));
				char c3=key.charAt(r.nextInt(key.length()));
				char c4=key.charAt(r.nextInt(key.length()));
				char c5=key.charAt(r.nextInt(key.length()));
				
				String Secretkey=""+c+""+c1+""+c2+""+c3+""+c4+""+c5;
				System.out.print(Secretkey);
				
				HttpSession session2=request.getSession();
				session.setAttribute( "key",Secretkey);
				
				
				%>
				
                    <%
                           HttpSession ss=request.getSession();
                   		ss.getAttribute("Username");
                   		ss.getAttribute("password");
                   		ss.setAttribute("Uusername", ss.getAttribute("Username"));
                   		ss.setAttribute("Ppassword", ss.getAttribute("password"));
                   		
                   		
                           %>          
                        
				<center>
				<h5>File Secret Key:</h5><input type="text" readonly="readonly" name="secretkey" value="<%=Secretkey%>"/>
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<br><br><br>
					<input type="file" name="file"> <br> <br>
				<input type="submit" value="Upload">
				</center>
				<!--/Item 12-->
			</form>
	
		
	
	
	
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