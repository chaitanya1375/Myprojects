<%@ page language="java" import="java.sql.*" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Orders List</title>
</head>
<body>
<% 
HttpSession nsession=request.getSession(false);
if(nsession.getAttribute("userid")==null){
	response.sendRedirect("error.404.jsp");}
else {
%>
		<div align="right">Welcome <h4><%=session.getAttribute("userid")%></h4>!!
		<a href='logout.jsp'>Logout</a></div>
		<% Class.forName("com.mysql.jdbc.Driver");
			Connection con =  DriverManager.getConnection("jdbc:mysql://localhost:3306/cart","root", "sree");
			Statement st =con.createStatement();
			request.getSession(true);
			String userid=(String)session.getAttribute("userid");
			ResultSet rs=st.executeQuery("select * from orders where username='"+userid+"'");
			
%>
		<form>
      		<table border="1">
      		<tr>
        		<TH>Order Id</TH>
        		<th>Order Description</th>
        		<th>Total Cost</th>
        		<th>Order Status</th>
        	</tr>
        	<% while(rs.next()){ %>
        	<TR>
               	<TD> <%= rs.getString(1) %> </TD>
               	<TD><%= rs.getString(2) %> </TD>
               	<td><%= rs.getString(3) %></td>
               	<td><%= rs.getString(4) %></td>
			</TR>
       	   <%

			} 
		   %>
		   
		   </TABLE>
       	   </form>
       <BR>
       <%} %>

</body>
</html>