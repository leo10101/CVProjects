<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<form:form method="POST" modelAttribute="booking" action="${pageContext.request.contextPath}/booking/summary">
	<h1>booking</h1>
	<input type="submit" value="click me!" />

	</form:form>

<h1>${selectedFId}</h1>
<h1>${bookingDate}</h1>


<select name="sessionNo">
			<c:forEach items="${availableSessionList}" var ="b">
				<option value="${b.sessionNo}">${b.startTime} --- ${b.endTime} </option>
			</c:forEach>
		</select>

</body>
</html>