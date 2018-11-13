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

<form:form method="POST" commandName="Facility"
	action="${pageContext.request.contextPath}/admin/new">
		<center>
			  <table cellpadding=4 cellspacing=2 border=0>
				<tr>
					<th width="45%">Description</th> 
					<th width="55%">Detail</th>
				</tr>
				<tr>
				   <td><s:message code="facility.id" /> *</td>
				   <td><form:input path="facilityid"/>
				   <form:errors path="facilityid" cssStyle="color: red;" /></td>
				 </tr>
				<tr>
				   <td><s:message code="facility.name" /> *</td>
				   <td><form:input path="facilityname"/>
				   <form:errors path="facilityname" cssStyle="color: red;" /></td>
				 </tr>
				
				<tr>
				   <td><s:message code="facility.description" /> *</td>
				   <td><form:input path="facilitydescription"/>
				   <form:errors path="facilitydescription" cssStyle="color: red;" /></td>
				 </tr>
				<tr>
				   <td><s:message code="facility.venue" /></td>
				   <td><form:input path="location"/>
				   <form:errors path="location" cssStyle="color: red;" /></td>
				 </tr>
				
				<tr>
				   <td><s:message code="facility.cappersession" /></td>
				   <td><form:input path="cappersession"/>
				   <form:errors path="cappersession" cssStyle="color: red;" /></td>
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