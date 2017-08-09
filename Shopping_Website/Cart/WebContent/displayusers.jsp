<%@ page language="java" import ="javax.servlet.*,java.sql.*" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Registered Users</title>
<SCRIPT type="text/javascript">
    window.history.forward();
    function noBack() { 
    	window.history.forward();
    	
    }
</SCRIPT>
</head>
<body>
<%
HttpSession nsession=request.getSession(false);
if(nsession.getAttribute("adminid")==null){
response.sendRedirect("error.404.jsp");}
else{
%>
	<div align="right"> <h4><%=session.getAttribute("userid")%></h4>!!<br>
			<a href='logout.jsp'>Logout</a><br></div>
<% Class.forName("com.mysql.jdbc.Driver");
			Connection con =  DriverManager.getConnection("jdbc:mysql://localhost:3306/cart","root", "sree");
			Statement st =con.createStatement();
			request.getSession(true);
			ResultSet rs=st.executeQuery("select * from users");
			
%>
		<h3><center>List of Registered Users:</center></h3>
      		<table border="1">
      		<tr>
        		<TH>First Name</TH>
        		<th>Last Name</th>
        		<th>Email</th>
        		<th>Contact</th>
        		<th>Username</th>
        	</tr>
        	<% while(rs.next()){ %>
        	<TR>
               	<TD> <%= rs.getString(1) %> </TD>
               	<TD><%= rs.getString(2) %> </TD>
               	<td><%= rs.getString(3) %></td>
               	<td><%= rs.getString(4) %></td>
               	<td><%=rs.getString(5) %></td>
			</TR>
       	   <%

			} 
		   %>
		   
		   </TABLE><br>
       <BR>
       <%} %>
</body>
</html>
