<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.5.2/jquery.min.js"></script>
<script type="text/javascript">
window.history.forward();
function noBack(){
	window.history.forward();
}
</script>

<script src="gooeymenu.js">
/***********************************************
* Gooey Menu Script (c) Dynamic Drive (www.dynamicdrive.com)
* This notice MUST stay intact for legal use
* Visit http://www.dynamicdrive.com/ for this script and 100s more.
***********************************************/
</script>
<title>login success</title>
<link rel="stylesheet" type="text/css" href="gooeymenu.css" />
<style>
#header {
    background-color:black;
    color:white;
    text-align:center;
    padding:5px;
}
#nav {
    line-height:30px;
    background-color:#eeeeee;
    height:300px;
    width:100px;
    float:left;
    padding:5px;	      
}
#section {
    width:350px;
    float:left;
    padding:10px;	 	 
}
#footer {
    background-color:black;
    color:white;
    clear:both;
    text-align:center;
   padding:5px;	 	 
}
</style>
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

<ul id="gooeymenu1" class="gelbuttonmenu">
<li><a href="myorders.jsp">My Orders</a></li>
<li><a href="myprofile.jsp">My Profile</a></li>
<li><a href="products.jsp">Shop Online</a></li>

</ul>
<%
    }
%>

<script>
gooeymenu.setup({id:'gooeymenu1', selectitem:1})
</script>
</body>
</html>
