<%@ page language="java" import="java.sql.*, java.io.*" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>specifications for product</title>
</head>
<body>
<% 
HttpSession nsession=request.getSession(false);
if(nsession.getAttribute("userid")==null){
	PrintWriter out1=response.getWriter();
	out1.println("Sorry you need to login");
	response.sendRedirect("userLogin.html");
}
else {%>
<div align="right">Welcome <h4><%=session.getAttribute("userid")%></h4>!!
<a href='logout.jsp'>Logout</a></div><br><br>
<%} %>
<%
String[] id=request.getParameterValues("selectitem");
Class.forName("com.mysql.jdbc.Driver");
Connection con = (Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/cart","root", "sree");
Statement st=con.createStatement();
ResultSet rs=st.executeQuery("Select * from products where id="+id[0]);
while(rs.next()){
%>

<form method="post" action="/Cart/AddToCart">
ID:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" name="id" value="<%= rs.getString(1) %>"><br>
Name:&nbsp;&nbsp;&nbsp;<input type="text" name="name" value="<%= rs.getString(2) %>"><br>
Price:&nbsp;&nbsp;<input type="text" name="price" value="<%= rs.getString(3) %>"><br>
Size:&nbsp;&nbsp;&nbsp;&nbsp;<select name="size">
  		<option value="small">Small</option>
  		<option value="medium">Medium</option>
  		<option value="large">Large</option>
  		<option value="xlarge">XLarge</option>
</select><br>
Quantity:&nbsp;&nbsp;&nbsp;&nbsp;
<input type="text" name="quantity" value="1" width="3"><br>
<input type="submit" value="Add to Cart">
</form>
<%
	} 
%>
</body>
</html>