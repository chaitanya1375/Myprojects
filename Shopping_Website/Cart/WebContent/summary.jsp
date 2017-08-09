<%@ page language="java" import="java.sql.*" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Order Summary</title>
</head>
<body>
<%
	Class.forName("com.mysql.jdbc.Driver");
	Connection con =  DriverManager.getConnection("jdbc:mysql://localhost:3306/cart","root", "sree");
	Statement st =con.createStatement();
	request.getSession(true);
	String orderid=session.getAttribute("orderid").toString();
	int s=st.executeUpdate("update orders set status='paid' where orderid="+orderid);
	if(s>0){
		
		response.sendRedirect("success.jsp");
	}
%>

</body>
</html>