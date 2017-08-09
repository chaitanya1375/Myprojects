<%@ page import ="java.sql.*, java.util.*" language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>registration processing...</title>
</head>
<body>

</body>
</html>
<%
    String user = request.getParameter("uname");    
    String pwd = request.getParameter("pass");
    String fname = request.getParameter("fname");
    String lname = request.getParameter("lname");
    String email = request.getParameter("email");
    Class.forName("com.mysql.jdbc.Driver").newInstance();
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/cart","root", "sree");
    PreparedStatement pst =(PreparedStatement)con.prepareStatement("insert into users(first_name, last_name, email, uname, pass, regdate) values (??????)");
    //ResultSet rs;
    out.println("registration proceed");
    pst.setString(1,fname);  
    pst.setString(2,lname);        
    pst.setString(3,email);
    pst.setString(4,user);
    pst.setString(5,pwd);
    pst.setString(6,"25-11-2014");
    int i=pst.executeUpdate();
    con.commit();
    if (i > 0) {
    	out.println("insert success");
        //session.setAttribute("userid", user);
        response.sendRedirect("welcome.jsp");
       // out.print("Registration Successfull!"+"<a href='index.jsp'>Go to Login</a>");
    } else {
    	out.println("failed");
    	%>Registration unsuccessful!! Sorry!!
        <a href="userLogin.jsp">Login again</a><% 
    }
%>