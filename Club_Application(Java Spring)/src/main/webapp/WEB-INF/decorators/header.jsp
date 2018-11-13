<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>homepage</title>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.0.0/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/ionicons/2.0.1/css/ionicons.min.css">
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,700">
<link rel="stylesheet" href="css/styles.min.css">

<style>
.navbar {
	overflow: hidden;
	background-color: #333;
	font-family: Arial, Helvetica, sans-serif;
}

.navbar a {
	float: left;
	font-size: 16px;
	color: white;
	text-align: center;
	padding: 10px 14px;
	text-decoration: none;
}

.dropbtn {
	background-color: #3104B4;
	color: white;
	padding: 16px;
	font-size: 16px;
	border: none;
}

.dropdown {
	position: relative;
	display: inline-block;
}

.dropdown-content {
	display: none;
	position: absolute;
	background-color: #324443;
	min-width: 160px;
	box-shadow: 0px 8px 16px 0px rgba(0, 0, 0, 0.2);
	z-index: 1;
}

.dropdown-content a {
	color: white;
	padding: 12px 16px;
	text-decoration: none;
	display: block;
}

.dropdown-content a:hover {
	background-color: #ddd
}

.dropdown:hover .dropdown-content {
	display: block;
}

.dropdown:hover .dropbtn {
	background-color: #324443;
}

/* body {
	background-image: url("image/wall.jpg");
	background-size: cover;
} */
}
</
head
>
</style>
<body>
<body>
	<c:choose>
		<c:when test="${sessionScope.currentuser.getMemberType() == 'admin' }">

		</c:when>
	</c:choose>
	<div>
		<nav
			class="navbar navbar-dark navbar-expand-md navigation-clean-search">
		<div class="container">
			<a class="navbar-brand" href="${pageContext.request.contextPath}/"><b>Club
					Application</b></a>
			<button class="navbar-toggler" data-toggle="collapse"
				data-target="#navcol-1">
				<span class="sr-only">Toggle navigation</span><span
					class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navcol-1">


				<%
					HttpSession session1 = request.getSession(false);
				%>


				<ul class="nav navbar-nav">
					<c:choose>
						<c:when test="${sessionScope.roleId == '0' }">


							<li class="nav-item" role="presentation"><a
								class="nav-link active"
								href="${pageContext.request.contextPath}/admin/mlist">Manage
									Members</a></li>
							<li class="nav-item" role="presentation"><a class="nav-link"
								href="${pageContext.request.contextPath}/user/list">Manage
									Facilities</a></li>
							<li class="nav-item" role="presentation"><a class="nav-link"
								href="${pageContext.request.contextPath}/admin/list">QuickCheckMemberList</a></li>
							<li class="nav-item" role="presentation"><a class="nav-link"
								href="${pageContext.request.contextPath}/booking/list">Booking
									List</a></li>

						</c:when>
						<c:otherwise>

							<li class="nav-item" role="presentation"><a
								class="nav-link active"
								href="${pageContext.request.contextPath}/">Home</a></li>
							<li class="nav-item" role="presentation"><a class="nav-link"
								href="${pageContext.request.contextPath}//booking/search">Booking</a></li>
							<li class="nav-item" role="presentation"><a class="nav-link"
								href="${pageContext.request.contextPath}/facility/facilitypage">Facilities</a></li>

						</c:otherwise>
					</c:choose>
				</ul>
				<form class="form-inline mr-auto" target="_self">
					<div class="form-group">
						<label for="search-field"></label>
					</div>
				</form>
				<%
					if (session1.getAttribute("memberNo") == null) {
				%>
				<span class="navbar-text"> <a
					href="${pageContext.request.contextPath}/login" class="login">
						LogIn </a></span> <a style="color: blue" "class="signup"
					href="${pageContext.request.contextPath}/admin/create"> SignUp
				</a>

				<%
					} else {
				%>

				<button class="dropbtn">
					Welcome:
					<c:out value="${memberName}" />
				</button>

				<a href="${pageContext.request.contextPath}/logout">Logout</a>

				<%
					}
				%>
				<ul class="nav navbar-nav"></ul>
			</div>
		</div>
		</nav>
		<script
			src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
		<script
			src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.0.0/js/bootstrap.bundle.min.js"></script>
	</div>
</body>
</html>