<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<div class="content">
	<div class="main-content">
		<div class="widget widget-table">
			<div class="widget-header">
				<h3>
					<i class="fa fa-table"></i>BookingList
				</h3>
			</div>
			<!-- SHOW HIDE COLUMNS DATA TABLE -->
			<div class="widget-content">
				<table id="datatable-column-interactive"
					class="table table-sorting table-striped table-hover datatable">
					<thead>
						<tr>
							<th>BookingNo</th>
							<th>MemberNo</th>
							<th>FacId</th>
							<th>BookingDate</th>
							<th>SessionNo</th>
							<th>Status</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="prod" items="${bookingList}">
							<tr>
								<td>${prod.bookingNo}</td>
								<td>${prod.memberNo}</td>
								<td>${prod.facilityId}</td>
								<td>${prod.bookingDate}</td>
								<td>${prod.sessionNo}</td>
								<td>${prod.status}</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>

		</div>
	</div>
</div>


