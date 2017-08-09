<%@ page import="java.sql.*, java.io.*, java.util.*" language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Products</title>
</head>
<body>
<% 
HttpSession nsession=request.getSession(false);
if(nsession.getAttribute("userid")==null){
}
else {%>
<div align="right">Welcome <h4><%=session.getAttribute("userid")%></h4>!!
<a href='logout.jsp'>Logout</a></div><br><br>
<%} %>
<% 
Class.forName("com.mysql.jdbc.Driver");
			Connection con =  DriverManager.getConnection("jdbc:mysql://localhost:3306/cart","root", "sree");
			Statement st =con.createStatement();
			ResultSet rs=st.executeQuery("select * from products order by id");
			
%>
		<form method="post" action="specifications.jsp">
      		<table border="1">
      		<tr>
        		<TH>Id</TH>
        		<th>Name</th>
        		<th>Price</th>
        		<th>Image</th>
        		<th>Select item to buy</th>
        	</tr>
        	<% while(rs.next()){ %>
        	<TR>
               	<TD> <%= rs.getString(1) %> </TD>
               	
               	<TD> <%= rs.getString(2) %> </TD>
               	<td><%= rs.getString(3) %></td>
               	<td><img src="C:\Users\sreenidhi\eclipse-workspace\Cart\WebContent\<%= rs.getString(4) %>" height="160" width="160" /></td>
               	<td><input type="checkbox" name="selectitem" value="<%=rs.getString(1) %>"></td>
                <td><input type="submit" value="Add to Cart"></td>

			</TR>
       	   <%

			} 
		   %>
		   
		   </TABLE>
       	   </form>
       <BR>
</body>
</html>