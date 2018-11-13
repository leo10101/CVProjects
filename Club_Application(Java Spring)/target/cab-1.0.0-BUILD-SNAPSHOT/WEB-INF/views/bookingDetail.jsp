<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<div class="tab-content profile-page">
	<!-- PROFILE TAB CONTENT -->
	<div class="tab-pane profile active" id="profile-tab">
		<form:form method="POST" modelAttribute="member"
			action="${pageContext.request.contextPath}/" class="form-horizontal"
			role="form">
			<fieldset>
				<h3>
					<i class="fa fa-square"></i>Booking Detail
				</h3>
				<br> <br>

				<table>
					<tr>
						<td><div class="form-group">
								<label for="MemberName" class="col-sm-3 control-label">MemberName</label>
							</div></td>
						<td><div class="col-sm-4">
								<label for="MemberName" class="col-sm-3 control-label">---</label>
							</div></td>
					</tr>

					<tr>
						<td><div class="form-group">
								<label for="BookingNo" class="col-sm-3 control-label">BookingNo</label></div></td>
						<td><div class="col-sm-4">
								<label for="BookingNo" class="col-sm-3 control-label">---</label>
							</div></td>
					</tr>

					<tr>
						<td><div class="form-group">
								<label for="BookingDate" class="col-sm-3 control-label">BookingDate</label></div></td>
						<td><div class="col-sm-4">
								<label for="BookingDate" class="col-sm-3 control-label">---</label>
							</div></td>
					</tr>

					<tr>
						<td><div class="form-group">
								<label for="FacilityName" class="col-sm-3 control-label">FacilityName</label></div></td>
						<td><div class="col-sm-4">
								<label for="FacilityName" class="col-sm-3 control-label">---</label>
							</div></td>
					</tr>

					<tr>
						<td><div class="form-group">
								<label for="StartTime" class="col-sm-3 control-label">StartTime</label></div></td>
						<td><div class="col-sm-4">
								<label for="StartTime" class="col-sm-3 control-label">---</label>
							</div></td>
					</tr>
				</table>

			</fieldset>
			<hr />

			<div class="form-group">
				<input type="button" value="Cancel" class="btn btn-primary "
					onclick="javascript:window.location.href ='${pageContext.request.contextPath}/';">

			</div>
			<hr />

		</form:form>
	</div>
</div>

