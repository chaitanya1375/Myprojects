<%@ page language="java" import="java.sql.*, javax.servlet.*, java.util.*" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Payment Gateway</title>
</head>
<SCRIPT type="text/javascript">
    window.history.forward();
    function noBack() { 
    	window.history.forward();
    }
</SCRIPT>
<body>
<% 
			Class.forName("com.mysql.jdbc.Driver");
			Connection con =  DriverManager.getConnection("jdbc:mysql://localhost:3306/cart","root", "sree");
			Statement st =con.createStatement();
			 HttpSession session1= request.getSession(true);
			String orderid=session.getAttribute("orderid").toString();
			out.println("Details of order with orderid: "+orderid);
			ResultSet rs=st.executeQuery("select * from orders where orderid="+orderid);
			while(rs.next()){
%>
<Form method="post" action="summary.jsp">
<table border="1">
<tr>
<th>Orderid</th>
<th>Items ordered</th>
<th>Total cost</th>
</tr>
<tr>
<td><%= rs.getString(1) %></td>
<td><%= rs.getString(2) %></td>
<td><%= rs.getString(3) %></td>
</tr>
<%} %>
</table>
<input type="submit" value="Pay">
</Form>
</body>
</html>