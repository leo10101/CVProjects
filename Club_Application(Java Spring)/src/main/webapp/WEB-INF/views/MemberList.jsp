<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="fa"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Member List Page</title>
</head>
<style>
th {
	background-color: LIGHTBLUE;
	color: white;
}
</style>
<body>
	 <a href="${pageContext.request.contextPath}/admin/mnew">Add
		Member</a> 
	<center>
		<b>MEMBERS LIST</b>
	</center>
	<table border="1" align="center">
		<tbody>
			<tr>
			
				<th>UserId</th>
				<!-- <th>UserPassword</th> -->
				<th>MemberNo</th>
				<th>ContactTitle</th>
				<th>MemberName</th>
				<th>DateOfBirth</th>
				<th>Address</th>
				<th>PostalCode</th>
				<th>Password</th>
				<th>PhoneNo</th>
				<th>Email</th>
				<th>Edit</th>

				<fa:forEach var="memlist" items="${memlist}">
					<tr>
						
						<td>${memlist.userId}</td>
						 
						<td>${memlist.memberNo}</td>
						<td>${memlist.contactTitle}</td>
						<td>${memlist.memberName}</td>
						
						<td>${memlist.dateOfBirth}</td>
						<td>${memlist.address}</td>
						<td>${memlist.postalCode}</td>
						<td>${memlist.userPassword}</td> 
						
						<td>${memlist.phoneNo}</td>
						<td>${memlist.email}</td>
						<td align="center"><a
							href="${pageContext.request.contextPath}/admin/medit/${memlist.memberNo}.html"><spring:message
									code="caption.edit" /></a></td>
					</tr>

				</fa:forEach>
		</tbody>
	</table>


</body>
</html>