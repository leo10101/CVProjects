<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<div class="content">
	<div class="main-content">
		<div class="widget widget-table">
			<div class="widget-header">
				<h3>
					<i class="fa fa-table"></i> MemberList
				</h3>
			</div>
			<!-- SHOW HIDE COLUMNS DATA TABLE -->
			<div class="widget-content">
				<table id="datatable-column-interactive"
					class="table table-sorting table-striped table-hover datatable">
					<thead>
						<tr>
							<th>RoleId</th>
							<th>UserId</th>
							<th>Password</th>
							<th>MemberNo</th>
							<th>MemberName</th>
							<th>DateOfBirth</th>
							<th>Address</th>
							<th>PostalCode</th>
							<th>ContactTitle</th>
							<th>PhoneNo</th>
							<th>Email</th>

						</tr>
					</thead>
					<tbody>
						<c:forEach var="prod" items="${memberList}">
							<tr>
								<td>${prod.roleId}</td>
								<td>${prod.userId}</td>
								<td>${prod.userPassword}</td>
								<td>${prod.memberNo}</td>
								<td>${prod.memberName}</td>
								<td>${prod.dateOfBirth}</td>
								<td>${prod.address}</td>
								<td>${prod.postalCode}</td>
								<td>${prod.contactTitle}</td>
								<td>${prod.phoneNo}</td>
								<td>${prod.email}</td>
								<%-- <td align="center"><i class="fa fa-edit"></i><a
									class="btn btn-block btn-custom-secondary"
									href="${pageContext.request.contextPath}/edit/${prod.memberId}">Edit</a></td> --%>

							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>

		</div>
	</div>
</div>
