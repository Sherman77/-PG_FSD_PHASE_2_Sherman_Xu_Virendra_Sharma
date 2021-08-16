<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import="FlyAwayApp.AdminLogin" %>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>  
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>  
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>  
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<c:set var="airline" value='<%= request.getParameter("airline") %>' />
	<c:set var="flight_number" value='<%= Integer.parseInt(request.getParameter("flight_number")) %>' />
	<c:set var="originate" value='<%= request.getParameter("originate") %>' />
	<c:set var="destination" value='<%= request.getParameter("destination") %>' />
	<c:set var="date" value='<%= request.getParameter("date") %>' />
	<c:set var="travelers" value='<%= Integer.parseInt(request.getParameter("travelers")) %>' />
	<c:set var="totalPrice" value='<%= Integer.parseInt(request.getParameter("totalPrice")) %>'/>
	<c:set var="name" value='<%= request.getParameter("name") %>' />
	<c:set var="email" value='<%= request.getParameter("email") %>' />
	<c:set var="phone" value='<%= request.getParameter("phone") %>' />
	
	<p>
	Thank you ${name} for your business. You've successfully booked ${travelers} tickets from ${originate} to ${destination} on ${date}.
	<br>
	Airline: ${airline}
	<br>
	Flight Number: ${flight_number}
	<br>
	Your total cost: <fmt:setLocale value = "en_US"/><fmt:formatNumber value = '${totalPrice}' type = "currency"/>
	<br>
	Your Email: ${email}
	<br>
	Your Phone Number: ${phone}
	<br>
	If you have any question, please contact <%=AdminLogin.user.getEmail()%>.
	</p>
	<br>
	<a href="index.html">Back to Home Page.</a>

</body>
</html>