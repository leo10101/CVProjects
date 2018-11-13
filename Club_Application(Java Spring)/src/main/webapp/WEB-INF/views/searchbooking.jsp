
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>booking</title>
<link rel="stylesheet" href="bootstrap/css/bootstrap(calender).min.css">
<link rel="stylesheet" href="css/styles(calender).min.css">
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link rel="stylesheet" href="/resources/demos/style.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script>
	$(function() {
		$("#datepicker").datepicker({
			minDate : 1,
			maxDate : "+3M"
		});

		$("#datepicker").datepicker("setDate", new Date());
	});
</script>
</head>
<body>
	<form:form method="POST" modelAttribute="booking"
		action="${pageContext.request.contextPath}/booking/choose">
<h1>Search The Booking</h1>
		<div class="form-row form-group">
			<div class="col-sm-2 label-column">
				<label class="col-form-label" for="facilityName"
					style="padding-right: 25%; font-family: 'Yanone Kaffeesatz', sans-serif; font-size: 20px;">Booking Date</label>
			</div>
			<div class=" input-column">
				<form:input path="bookingDate" id="datepicker" name="bookingDate" />
			</div>
		</div>
		<br />
		<div class="form-row form-group">
			<div class="col-sm-2 label-column">
				<label class="col-form-label" for="facilityName"
					style="padding-right: 25%; font-family: 'Yanone Kaffeesatz', sans-serif; font-size: 20px;">Facility
					Name</label>
			</div>
			<div class="input-column">
				<select name="facilityId">
					<c:forEach items="${facilityList}" var="f">
						<option value="${f.facilityId}">${f.facilityName}</option>
					</c:forEach>
				</select>
			</div>
		</div>

		<br />
		<div class="form-row form-group">
		<div class="col-sm-2 label-column">
			<input class="btn btn-primary" type="submit" value="Search" /> 
			</div>
			<div class="col-sm-2 label-column">
			<a class="btn btn-primary" href="/cab">Cancel</a>
			</div>
		</div>



		</div>
		<br />
	</form:form>
	<script src="js/jquery(calender).min.js"></script>
	<script src="bootstrap/js/bootstrap(calender).min.js"></script>
</body>
</html>