<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>



<div class="tab-content profile-page">
	<!-- PROFILE TAB CONTENT -->
	<div class="tab-pane profile active" id="profile-tab">
		<form:form method="POST" modelAttribute="booking"
			action="${pageContext.request.contextPath}/booking/create"
			class="form-horizontal" role="form">

			<fieldset>
				<h3>
					<i class="fa fa-square"></i>Choose Booking
				</h3>
				<br> <br>

				
				<div class="col-sm-4">
				MemberNo
				<form:input path="memberNo" class="form-control" required="required" />
				FacId
				<form:input path="facilityId" class="form-control" required="required" />
				BookingDate
				<%-- <form:hidden path="bookingDate" class="form-control" value="2018-05-03" /> --%>
				<form:input path="bookingDate" class="form-control" required="required" />
				SessionNo
				<form:input path="sessionNo" class="form-control" required="required" />
				Status
				<form:input path="status" class="form-control" required="required" />
					<%-- <form:hidden path="memberNo"class="form-control" value=10 />
					<form:hidden path="facilityId" class="form-control" value=5 />
					
					<form:hidden path="bookingDate" class="form-control" value="2018-05-03" />
					<form:hidden path="sessionNo" class="form-control" value=1 />
					<form:hidden path="status" class="form-control" value="Booked" /> --%>
				</div>
				
				
					
			</fieldset>
			<hr />

			<div class="form-group">
				<input type="submit" value="Create" class="btn btn-primary " /> 

			</div>
			<hr />

		</form:form>
	</div>
</div>

</body>
</html>