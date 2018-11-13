<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="fa"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Facility List Page</title>
</head>
<style>

th{
   background-color: LIGHTBLUE;
    color: white;
}
</style>
<body>
<a href="${pageContext.request.contextPath}/user/new">Add Facility</a> 
	<center>
		<b>FACILITY LIST</b>
	</center>
	<table border="1" align="center">
		<tbody>
			<tr>
				<th>FacilityId</th>
				<th>FacilityName</th>
				<th>Facility Description</th>
				<th>Capacity Per Session</th>
				<th>Location</th>
				<th>Edit</th>
				<th>Delete</th>



				<fa:forEach var="faclist" items="${faclist}">
					<tr>
						<td>${faclist.facilityId}</td>
						<td>${faclist.facilityName}</td>
						<td>${faclist.facilityDescription}</td>
						<td>${faclist.capPerSession}</td>
						<td>${faclist.location}</td>


						<td align="center"><a
							href="${pageContext.request.contextPath}/user/edit/${faclist.facilityId}.html"><spring:message
									code="caption.edit" /></a></td>
						<td><a
							href="${pageContext.request.contextPath}/user/delete/${faclist.facilityId}.html"><spring:message
									code="caption.delete" /></a></td>
					</tr>

				</fa:forEach>
		</tbody>
	</table>


</body>
</html>