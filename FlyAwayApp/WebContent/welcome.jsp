<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import="FlyAwayApp.AdminLogin" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Welcome Page</title>
</head>
<body>
	<%= java.util.Calendar.getInstance().getTime() %>
	<br>
	<%= "Welcome " + AdminLogin.user.getEmail()%>
	<br>
	<section>
		<h2><b>If you would like to change your password, please enter your new password.</b></h2>
			<form action="login" method="post">  
				<table>
					<tr>
						<td>New Password</td>
						<td><input type="password" name="newPassword" /></td>
					</tr>
				</table>
			<button type="submit">Change Password</button>
			</form>
	</section>
	<br>
	<br>
	<section>
		<h2><b>Enter flight information to add a new flight.</b></h2>
		<form action="addNewFlight.jsp" method="post">
			Airline: <input type="text" name="airline" id="airline">
			Flight Number: <input type="number" name="flight_number" id="flight_number">
			From: <input type="text" name="originate" id="originate">
			To: <input type="text" name="destination" id="destination">
			Travel Date: <input type="text" name="date" id="date">
			Price: <input type="number" name="price" id="price">
			<button type="submit">Add Flight</button>
		</form>
	</section>

</body>
</html>