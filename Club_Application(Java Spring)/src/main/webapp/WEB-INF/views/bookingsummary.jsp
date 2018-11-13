<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<div><h1>Booking Summary</h1>
	</div>
	<br>
	<br>
	<form>
		<div class="form-row form-group">
			<div class="col-sm-2 label-column">
				<label class="col-form-label" for="Member
					Name"
					style="padding-right: 25%; font-family: 'Yanone Kaffeesatz', sans-serif; font-size: 15px;">Member
					Name</label>
			</div>
			<div class=" input-column">${mName}</div>
		</div>

		<div class="form-row form-group">
			<div class="col-sm-2 label-column">
				<label class="col-form-label" for="facilityName"
					style="padding-right: 25%; font-family: 'Yanone Kaffeesatz', sans-serif; font-size: 15px;">Facility
					Name</label>
			</div>
			<div class=" input-column">${fname}</div>
		</div>

		<div class="form-row form-group">
			<div class="col-sm-2 label-column">
				<label class="col-form-label" for="Booking Time"
					style="padding-right: 25%; font-family: 'Yanone Kaffeesatz', sans-serif; font-size: 15px;">Booking Time</label>
			</div>
			<div class=" input-column">${sTime}---${eTime}</div>
		</div>

		<div class="form-row form-group">
			<div class="col-sm-2 label-column">
				<label class="col-form-label" for="BookingID"
					style="padding-right: 25%; font-family: 'Yanone Kaffeesatz', sans-serif; font-size: 15px;">BookingID</label>
			</div>
			<div class=" input-column">${booking.bookingNo }</div>
		</div>

		<div class="form-row form-group">
			<div class="col-sm-2 label-column">
				<label class="col-form-label" for="MemberID"
					style="padding-right: 25%; font-family: 'Yanone Kaffeesatz', sans-serif; font-size: 15px;">MemberID</label>
			</div>
			<div class=" input-column">${booking.memberNo }</div>
		</div>

		<div class="form-row form-group">
			<div class="col-sm-2 label-column">
				<label class="col-form-label" for="Booking Date"
					style="padding-right: 25%; font-family: 'Yanone Kaffeesatz', sans-serif; font-size: 15px;">Booking Date</label>
			</div>
			<div class=" input-column">
				<fmt:formatDate type="date" value="${booking.bookingDate}" />
			</div>
		</div>

























	</form>
	<a class="btn btn-primary" href="/cab">OK</a>

</body>
</html>