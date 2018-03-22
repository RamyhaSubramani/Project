<!DOCTYPE HTML>
<%@page import="java.util.*" %>
<%@page import="java.sql.*" %>
<%@page import="com.dbcon.*" %>

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
				
				
				<li class="selected">
					<a href="Logout.jsp">LOGOUT</a>
				</li>
				<li>
					<a href="contact.html">CONTACT</a>
				</li>
			</ul>
		</div>
	</div>
	<br><br><br><br><br><br>
	<br><br><br><br><br><br>
	
	
	<%      
            HttpSession ss=request.getSession();
        
        
     /*    ss.setAttribute("UUsername",ss.getAttribute("Username"));
		ss.setAttribute("PPassword",ss.getAttribute("Password"));
		ss.setAttribute("FFilename",ss.getAttribute("Filename"));
		ss.setAttribute("PPrivatekey",ss.getAttribute("Privatekey"));
		ss.setAttribute("FFFilerequest",ss.getAttribute("FFilerequest"));       
             */
	
		  
           /* String reqname=ss.getAttribute("Uusername").toString(); */
             String name=ss.getAttribute("Ownername").toString();
             System.out.println("The valueeeeeee"+name);
//              String pass=ss.getAttribute("Password").toString();
             String file=ss.getAttribute("Filename").toString();
             String key=ss.getAttribute("filekey").toString();
               
             %>  
    <div class="col-md-8" >
        
         <div class="alert alert-info" >
             <div class="form-group">
                 <strong>ADMIN PAGE</strong>      
                 
                 
                 
                 
                 
                    
                <table border="5" style="overflow-y:scroll">
<tr>

<td width="200"><label>FileName  </label>   </td>
<td width="200"><label>Private key  </label>   </td>
<td width="200"><label>Owner name </label>   </td>
<!-- <td width="200"><label>Password </label>   </td> -->
<td width="200"><label>Request </label>   </td>
<td width="200"><label>Access </label>   </td>


</tr>
    	
                
               
          
              
    
    <% 
    /* String filename=null;
	
	String keyname=null;
	
	String namename=null;
	
   	String passname=null;
   	
   	String request2name=null; */
 
    Connection con=Regdb.Connect();
    try
    
    {
    	
    	PreparedStatement ps=(PreparedStatement)con.prepareStatement("  SELECT * FROM `deduplication`.`request_file` where Filerequest1='Not Update'");
    	
    	   	
	
    	System.out.println(ps);
    	
    	ResultSet sc=ps.executeQuery();
    	while(sc.next())
    	{
    		/* filename=sc.getString(1);
    		System.out.println(filename);
    		
    		keyname=sc.getString(2);
    		
    		namename=sc.getString(3); 
    		
    		passname=sc.getString(4);
    		
    		request2name=sc.getString(5); */
    		
    		%>
    		                  
                <tr>
                
             	<td><%=sc.getString(1) %></td>
             	
             	<td><%=sc.getString(2) %></td>
             	
             	<td><%=sc.getString(3) %></td>
             	
             	<td><%=sc.getString(4) %></td>
             	
<%--              	<td><%=sc.getString(5) %></td>  --%>
             	
             	
             	
             	<td><a href="Accept?filename=<%=sc.getString(1) %>&&privatekey=<%=sc.getString(2) %>&&Ownername=<%=sc.getString(3) %>"><button>Allow</button></a></td>
             	 
             	 </tr>
                
    	<%
    	}
    	 
    	%>   
    	
    	
    	
    	
    	
    	   
    	
                 
              
               
               
             	
        </table>
	
	<br />
    </div>
    </form>
          </div>
     </div>
 </div>
</div>
</section>
               
               
    	
    	
    	
    	<% 
    	 
    	
    }
   
    	 catch(Exception e)
    	{
    		e.printStackTrace();
    	}
    	
    
    
    
    %>    
	
	
	
	
	
	
	
	
	 	
			<br><br><br><br><br>
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