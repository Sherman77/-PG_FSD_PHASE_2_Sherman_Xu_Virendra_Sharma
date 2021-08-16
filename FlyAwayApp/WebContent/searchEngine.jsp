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
<title>Flight searching results.</title>
</head>
<body>
	<!-- sql:setDataSource tag -->
	<sql:setDataSource var="db" driver="com.mysql.jdbc.Driver"  
	     url="jdbc:mysql://localhost:3306/flyaway"  
	     user="root"  password="system"/>
	
	<section>
		<table>
			<thead>
				<tr>
					<th>Airline</th>
					<th>Flight Number</th>
					<th>From</th>
					<th>To</th>
					<th>Date</th>
					<th>Price</th>
					<th>Select</th>
				</tr>
			</thead>
			
			<tbody>
				<c:set var="originate" value='<%= request.getParameter("originate") %>' />
				<c:set var="destination" value='<%= request.getParameter("destination") %>' />
				<c:set var="date" value='<%= request.getParameter("date") %>' />
				
				<!-- sql:query  tag --> 
				<sql:query dataSource="${db}" var="rs">  
				SELECT * from flights WHERE originate='${originate}' AND destination='${destination}' AND date='${date}';  
				</sql:query>
				
				<c:forEach var="record" items='${rs.rows}'>
					<tr>
						<td><c:out value='${record.airline}'/></td>
						<td><c:out value='${record.flight_number}'/></td>
						<td><c:out value='${record.originate}'/></td>
						<td><c:out value='${record.destination}'/></td>
						<td><c:out value='${record.date}'/></td>
						<td>
							<c:set var="ticketPrice" value='${record.price}'/>
							<fmt:setLocale value = "en_US"/>
         					<fmt:formatNumber value = '${ticketPrice}' type = "currency"/>
						</td>
						<td>
							<form action="booking.jsp" method="post">
								<input type="hidden" name="airline" id="airline" value='${record.airline}'>
								<input type="hidden" name="flight_number" id="flight_number" value='${record.flight_number}'>
								<input type="hidden" name="originate" id="originate" value='${record.originate}'>
								<input type="hidden" name="destination" id="destination" value='${record.destination}'>
								<input type="hidden" name="date" id="date" value='${record.date}'>
								<input type="hidden" name="price" id="price" value='${record.price}'>
								<input type="hidden" name="travelers" id="travelers" value=<%=request.getParameter("travelers")%>>
								<button type="submit">Book this flight</button>
							</form>
						</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</section>
	<br>
	<a href="index.html">Back to Home Page.</a>
</body>
</html>