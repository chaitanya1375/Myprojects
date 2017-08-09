<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Logged out</title>

<SCRIPT type="text/javascript">
    window.history.forward();
    function noBack() { 
    	window.history.forward();
    	<% 
    	session.invalidate();
    	%>
    }
</SCRIPT>
</head>
<form action="Hello.html">
<input type="submit" value="Confirm Logout?" onclick="return noBack()">
</form>
</html>