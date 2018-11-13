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
			action="${pageContext.request.contextPath}/memberlogin" class="form-horizontal"
			role="form">
			<fieldset>
				<h3>
					<i class="fa fa-square"></i>Login Form
				</h3>
				<br>
				<div class="form-group">
					<label for="UserId" class="col-sm-3 control-label">UserId </label>
				</div>
				<div class="col-sm-4">
					<input type="text" class="form-control" name="memberNo"
						required="required" />
				</div>
				<div class="form-group">
					<label for="password" class="col-sm-3 control-label">Password
					</label>
					<div class="col-sm-4">
						<input type="password" name="password" class="form-control"
							required="required" />
					</div>
				</div>
				<c:out value="${invalidloginmessage}" />

			</fieldset>
			<hr />

			<div class="form-group">
				<input type="submit" value="Login" class="btn btn-primary " /> <input
					type="button" value="Cancel" class="btn btn-primary "
					onclick="javascript:window.location.href ='${pageContext.request.contextPath}/';">

			</div>
			<hr />

		</form:form>
	</div>
</div>

