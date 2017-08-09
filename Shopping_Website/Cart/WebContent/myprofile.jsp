<%@ page import="java.sql.*" language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>User Profile</title>

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
			<h3><div align="center">Profile Details</div></h3>
<% 			
			//String userid = request.getParameter("uname");
			Class.forName("com.mysql.jdbc.Driver");
			Connection con =  DriverManager.getConnection("jdbc:mysql://localhost:3306/cart","root", "sree");
			Statement st =con.createStatement();
			ResultSet rs=st.executeQuery("select * from users where uname='"+session.getAttribute("userid")+"'");
			while(rs.next()){
%>
      		<table border="1">
      		<tr>
        		<TH>First Name</TH>
        		<th>LastName</th>
        		<th>Email id</th>
        		<th>Contact</th>
        		<th>Username</th>
        	</tr>
        	<TR>
               	<TD> <%= rs.getString(1) %> </TD>
               	<TD> <%= rs.getString(2) %> </TD>
               	<TD> <%= rs.getString(3) %> </TD>
               	<TD> <%= rs.getString(4) %> </TD>
               	<td> <%= rs.getString(5) %> </td>
			</TR>

       	   </TABLE>
       <BR>
       <% 
           } 
    }
       %>
    </table>
</body>
</html>