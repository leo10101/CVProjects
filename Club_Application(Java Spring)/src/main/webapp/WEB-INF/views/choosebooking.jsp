<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>



<div class="tab-content profile-page">
	<!-- PROFILE TAB CONTENT -->
	<div class="tab-pane profile active" id="profile-tab">
		<form:form method="POST" modelAttribute="booking"
			action="${pageContext.request.contextPath}/booking/summary"
			class="form-horizontal" role="form">

			<fieldset>
				<h3>
					<i class="fa fa-square"></i>Choose Booking
				</h3>
				<br> <br>


				<div class="col-sm-4">
					MemberNo
					<form:input path="memberNo" class="form-control"
						required="required"  value="${value}" readonly="true"/>
					<Br> Facility Name
				
					<input class="form-control" value = "${facility.facilityName}  " readonly="true" />
						
					<form:hidden path="facilityId" class="form-control" />
					
					<br> Booking Date<br>
					<form:input path="bookingDate" class="form-control"
						 readonly="true" />
					<Br>
					<br> SessionNo					
					<select name="sessionNo">
						<c:forEach items="${availableSessionList}" var="b">
							<option value="${b.sessionNo}">${b.startTime}---
								${b.endTime}</option>
						</c:forEach>
					</select><br>
					<br> 					
				<form:hidden path="status" class="form-control" value="Booked" />
				</div>



			</fieldset>
			<hr />

			<div class="form-group">
				<input type="submit" value="Make Booking" class="btn btn-primary " />
					
				<!-- 	<button class="btn btn-light submit-button button-hover"
							formaction="/cab/booking/search"
							type="submit"
							formmethod="get">
							Submit
						</button> -->
						<a class="btn btn-primary" href="/cab/booking/search">Cancel</a>
			</div>
			<hr />

		</form:form>
	</div>
</div>

</body>
</html>