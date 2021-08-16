<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>FlyAway searching system..</title>
</head>
<body>
	<h2><b>Enter criterias to search for flights</b></h2>
	<br>
	<section>
		<form action="searchEngine.jsp" method="post">
			From: <input type="text" name="originate" id="originate">
			To: <input type="text" name="destination" id="destination">
			Travel Date: <input type="text" name="date" id="date">
			Number Of Travelers: <input type="number" name="travelers" id="travelers">
			<button type="submit">Search</button>
		</form>
	</section>
	
</body>
</html>