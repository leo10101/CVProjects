<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link href="<c:url value='/css/style.css'/>" rel="stylesheet"
	type="text/css" />
</head>
<body>

<form:form method="POST" commandName="Member"
	action="${pageContext.request.contextPath}/admin/mnew">
		<center>
			  <table cellpadding=4 cellspacing=2 border=0>
				<tr>
					<th width="45%">Description</th> 
					<th width="55%">Detail</th>
				</tr>
				<tr>
				   <td><s:message code="member.roleid" /> *</td>
				   <td><form:input path="roleid"/>
				   <form:errors path="roleid" cssStyle="color: red;" /></td>
				 </tr>
				<tr>
				   <td><s:message code="member.userid" /> *</td>
				   <td><form:input path="userid"/>
				   <form:errors path="userid" cssStyle="color: red;" /></td>
				 </tr>
				
				<tr>
				   <td><s:message code="member.memberno" /> *</td>
				   <td><form:input path="memberno"/>
				   <form:errors path="memberno" cssStyle="color: red;" /></td>
				 </tr>
				 <tr>
				   <td><s:message code="member.contacttitle" /></td>
				   <td><form:input path="contacttitle"/>
				   <form:errors path="contacttitle" cssStyle="color: red;" /></td>
				 </tr>
				 
				<tr>
				   <td><s:message code="member.membername" /></td>
				   <td><form:input path="membername"/>
				   <form:errors path="membername" cssStyle="color: red;" /></td>
				 </tr>
				
				<tr>
				   <td><s:message code="member.dateofbirth" /></td>
				   <td><form:input path="dateofbirth"/>
				   <form:errors path="dateofbirth" cssStyle="color: red;" /></td>
				 </tr>
				 
				 				<tr>
				   <td><s:message code="member.address" /></td>
				   <td><form:input path="address"/>
				   <form:errors path="address" cssStyle="color: red;" /></td>
				 </tr>
				
				 				<tr>
				   <td><s:message code="member.postalcode" /></td>
				   <td><form:input path="postalcode"/>
				   <form:errors path="postalcode" cssStyle="color: red;" /></td>
				 </tr>
				 
				  <tr>
				   <td><s:message code="member.userpassword" /></td>
				   <td><form:input path="userpassword"/>
				   <form:errors path="contacttitle" cssStyle="color: red;" /></td>
				 </tr>
				 
				
				 
				 								 
				 				<tr>
				   <td><s:message code="member.phoneno" /></td>
				   <td><form:input path="phoneno"/>
				   <form:errors path="phoneno" cssStyle="color: red;" /></td>
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