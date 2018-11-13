<%-- <%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<h1>Register</h1>

</body>
</html> --%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<div class="tab-content profile-page">
	<!-- PROFILE TAB CONTENT -->
	<div class="tab-pane profile active" id="profile-tab">
		<form:form method="POST" modelAttribute="member"
			action="${pageContext.request.contextPath}/admin/create" class="form-horizontal"
			role="form">
			
			<fieldset>
				<h3>
					<i class="fa fa-square"></i>Registration Form
				</h3>
				<br>
				<br>

				<div class="form-group">
					<label for="RoleId" class="col-sm-3 control-label">RoleID
						</label>
						</div>
					<div class="col-sm-4">
						<form:input path="roleId" class="form-control"
							required="required" />
					</div>
					<div class="form-group">
					<label for="UserId" class="col-sm-3 control-label">UserId
						</label>
						</div>
					<div class="col-sm-4">
						<form:input path="userId" class="form-control"
							required="required" />
					</div>
					<div class="form-group">
					<label for="UserPassword" class="col-sm-3 control-label">Password
						</label>
						</div>
					<div class="col-sm-4">
						<form:input path="userPassword" class="form-control"
							required="required" />
					</div>
				<div class="form-group">
					<label for="MemberName" class="col-sm-3 control-label">Member
						Name</label>
						</div>
					<div class="col-sm-4">
						<form:input path="memberName" class="form-control"
							required="required" />
					</div>
					
					<div class="form-group">
						<label for="DateOfBirth" class="col-sm-3 control-label">Date
							Of Birth</label>
						<div class="col-sm-4">
							<form:input path="dateOfBirth" class="form-control" required="required" />
						</div>
					</div>
					<div class="form-group">
						<label for="Address" class="col-sm-3 control-label">Address</label>
						<div class="col-sm-4">
							<form:input path="address" class="form-control" required="required" />
						</div>
						<div class="form-group">
							<label for="PostalCode" class="col-sm-3 control-label">PostalCode</label>
							<div class="col-sm-4">
								<form:input path="postalCode" class="form-control" required="required" />
							</div>
						</div>
					</div>
					<div class="form-group">
						<label for="ContactTitle" class="col-sm-3 control-label">Contact
							Title</label>
						<div class="col-sm-4">
							<form:input path="contactTitle" class="form-control" required="required" />
						</div>
					</div>
					<div class="form-group">
						<label for="PhoneNo" class="col-sm-3 control-label">Phone
							No</label>
						<div class="col-sm-4">
							<form:input path="phoneNo" class="form-control" required="required" />
						</div>
					</div>
					<div class="form-group">
						<label for="Email" class="col-sm-3 control-label">Email</label>
						<div class="col-sm-4">
							<form:input path="email" class="form-control" required="required" />
						</div>
					</div>					
			</fieldset>
			<hr />

		<div class="form-group">
				<input type="submit" value="Create" class="btn btn-primary " /> <input
					type="button" value="Cancel" class="btn btn-primary "
					onclick="javascript:window.location.href ='${pageContext.request.contextPath}/';">

			</div>
			<hr />

		</form:form>
	</div>
</div>

