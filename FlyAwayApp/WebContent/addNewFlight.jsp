<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import="java.io.*,java.util.*,java.sql.*"%>  
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>  
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>  
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>  
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Flight successfully added.</title>
</head>
<body>
	<!-- sql:setDataSource tag -->
	<sql:setDataSource var="db" driver="com.mysql.jdbc.Driver"  
	     url="jdbc:mysql://localhost:3306/flyaway"  
	     user="root"  password="system"/>
	       
	<!--  get attributes from request -->
	<c:set var="airline" value='<%= request.getParameter("airline") %>' />
	<c:set var="flight_number" value='<%= Integer.parseInt(request.getParameter("flight_number")) %>' />
	<c:set var="originate" value='<%= request.getParameter("originate") %>' />
	<c:set var="destination" value='<%= request.getParameter("destination") %>' />
	<c:set var="date" value='<%= request.getParameter("date") %>' />
	<c:set var="price" value='<%= Integer.parseInt(request.getParameter("price")) %>' />
	
	<!-- sql:update tag to INSERT -->    
	<sql:update dataSource="${db}" var="count">  
	INSERT INTO flights (airline, flight_number, price, originate, destination, date) VALUES ("${airline}", ${flight_number}, ${price}, "${originate}", "${destination}", "${date}");  
	</sql:update> 
	
	<blink>Flight Successfully Added.</blink>
	<br>
	<a href="welcome.jsp">Add More Flights.</a>
	<br>
	<a href="index.html">Back to Home Page.</a>
</body>
</html>