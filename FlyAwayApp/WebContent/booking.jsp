<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import="java.io.*,java.util.*,java.sql.*"%>  
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>  
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>  
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Booking flight tickets</title>
</head>
<body>
	<!--  get attributes from request -->
	<c:set var="airline" value='<%= request.getParameter("airline") %>' />
	<c:set var="flight_number" value='<%= Integer.parseInt(request.getParameter("flight_number")) %>' />
	<c:set var="originate" value='<%= request.getParameter("originate") %>' />
	<c:set var="destination" value='<%= request.getParameter("destination") %>' />
	<c:set var="date" value='<%= request.getParameter("date") %>' />
	<c:set var="price" value='<%= Integer.parseInt(request.getParameter("price")) %>' />
	<c:set var="travelers" value='<%= Integer.parseInt(request.getParameter("travelers")) %>' />
	<c:set var="totalPrice" value='${price * travelers}' />
	<p>
		Purchasing ${travelers} tickets from ${originate} to ${destination} on ${date}.
		<br>
		Airline: ${airline}
		<br>
		Flight Number: ${flight_number}
		<br>
		Total amount due: <fmt:setLocale value = "en_US"/><fmt:formatNumber value = '${totalPrice}' type = "currency"/>
		<br>
	</p>
	<h2><b>Enter traveler details to book tickets</b></h2>
	<section>
		<form action="paymentConfirm.jsp" method="post">
			Name: <input type="text" name="name" id="name">
			Email: <input type="email" name="email" id="email">
			Phone Number: <input type="tel" name="phone" id="phone" pattern="[0-9]{3}-[0-9]{3}-[0-9]{4}" required>
			<small>Format: 123-456-7890</small>
			Payment: <input type="password" name="payment" id="payment">
			<input type="hidden" name="airline" id="airline" value='${airline}'>
			<input type="hidden" name="flight_number" id="flight_number" value='${flight_number}'>
			<input type="hidden" name="originate" id="originate" value='${originate}'>
			<input type="hidden" name="destination" id="destination" value='${destination}'>
			<input type="hidden" name="date" id="date" value='${date}'>
			<input type="hidden" name="totalPrice" id="totalPrice" value='${totalPrice}'>
			<input type="hidden" name="travelers" id="travelers" value='${travelers}'>
			<button type="submit">Confirm and Pay</button>
		</form>
	</section>
	
	
</body>
</html>