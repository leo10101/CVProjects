<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link href="<c:url value='/css/style.css'/>" rel="stylesheet"
	type="text/css" />
</head>
<style>
.button {
	background-color: lightblue;
	border: none;
	color: black;
	padding: 15px 32px;
	text-align: center;
	text-decoration: none;
	display: inline-block;
	font-size: 16px;
	border-radius: 12px;
}
</style>
<body>

	<center>
		<b> ADD NEW MEMBER </b>
	</center>

	<form:form method="POST" modelAttribute="Member"
		action="${pageContext.request.contextPath}/admin/mnew.html">

		<center>
			<table cellpadding=5 cellspacing=3 border=0>
				<tr>
					<th width="45%">Description</th> 
					<th width="55%">Detail</th>
				</tr>
				<form:hidden path="roleId" class="form-control" value="1" />
				<tr>
				   <td><s:message code="member.userId" /> *</td>
				   <td><form:input path="userId"/>
				   <form:errors path="userId" cssStyle="color: red;" /></td>
				 </tr>
				 <tr>
				   <form:hidden path="contactTitle" class="form-control" value="sig" />
				 </tr>
				 
				<tr>
				   <td><s:message code="member.memberName" /></td>
				   <td><form:input path="memberName"/>
				   <form:errors path="memberName" cssStyle="color: red;" /></td>
				 </tr>
				
				<tr>
				   <td><s:message code="member.dateOfBirth" /></td>
				   <td><form:input path="dateOfBirth"/>
				   <form:errors path="dateOfBirth" cssStyle="color: red;" /></td>
				 </tr>
				 
				 				<tr>
				   <td><s:message code="member.address" /></td>
				   <td><form:input path="address"/>
				   <form:errors path="address" cssStyle="color: red;" /></td>
				 </tr>
				
				 				<tr>
				   <td><s:message code="member.postalCode" /></td>
				   <td><form:input path="postalCode"/>
				   <form:errors path="postalCode" cssStyle="color: red;" /></td>
				 </tr>
				 
				  <tr>
				   <td><s:message code="member.userPassword" /></td>
				   <td><form:input path="userPassword"/>
				   <form:errors path="userPassword" cssStyle="color: red;" /></td>
				 </tr>
				 
				<tr>
				   <td><s:message code="member.phoneNo" /></td>
				   <td><form:input path="phoneNo"/>
				   <form:errors path="phoneNo" cssStyle="color: red;" /></td>
				 </tr>
				 
				 				<tr>
				   <td><s:message code="member.email" /></td>
				   <td><form:input path="email"/>
				   <form:errors path="email" cssStyle="color: red;" /></td>
				 </tr>
			
				 <tr>
				 <td><input type="submit" value="Submit"> </td>
				 <td><input type="reset" value="Reset"></td>
				 </tr>

				
			</table>
		</center>

	</form:form>
</body>
</html>