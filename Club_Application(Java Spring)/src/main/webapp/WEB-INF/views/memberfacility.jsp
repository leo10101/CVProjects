<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>MemberFacility</title>

<%--Script jQuery Calender--%>
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link rel="stylesheet" href="/resources/demos/style.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script>
	$(function() {
		$("#datepicker").datepicker({
			<%-- Format date, min and max--%>
			dateFormat : 'yy-mm-dd',
			minDate : 0,
			maxDate : "+3M"
		});

	});

	/*  */
</script>

<%-- Customised digital clock --%>
<%-- Digital clock to display dd Month yyyy hh:mm:ss --%>
<script type="text/javascript">
var myVar=setInterval(function () {myTimer()}, 1000);
var counter = 0;
function myTimer() {
    var date = new Date();
    <%-- Array to get month by index --%>
    var months = ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"];
    <%-- Concetanation of dd, MONTH and yyyy --%>
    var dateString = date.getDate().toString() + " " + months[date.getMonth()].toString() + " " + date.getFullYear().toString();
    var hour = date.getHours();
    var minute = date.getMinutes();
    var second = date.getSeconds();
    var hourString = hour.toString();
    var minuteString = minute.toString();
    var secondString = second.toString();
    
    <%-- Add a 0 infront if hour, minute or second is a single digit --%>
    if(hour < 10) {
    	hourString = "0"+hour.toString();
    }
    if(minute < 10){
    	minuteString = "0"+minute.toString();
    }
    if(second < 10){
    	secondString = "0"+second.toString();
    }
    
    <%-- Concetenate hour, minute and second --%>
    timeString = hourString+":"+minuteString+":"+secondString;
    
    <%-- Display string in html --%>
    document.getElementById("time").innerHTML = dateString + "  " + timeString;
}
</script>


<title>Facility</title>

<style>

/* CSS Style formatting with dynamic format  */
.box {
	height: 60%;
	width: 80%;
	background-color: #e7e7e7;
	padding: 25px;
	margin: 25px;
	display: inline-block;
	width: 80%;
}

.toprow {
	height: 70%;
	width: 100%
}

.imagecolumn {
	height: 70%;
	width: 60%;
}

.detailscolumn {
	height: 70%;
	width: 40%;
	margin: auto;
}

.image {
	max-width: 80%;
	min-height: 200px;
	height: auto;
	margin: auto;
	height: auto;
}

.button {
	background-color: #555555;
	border: none;
	color: white;
	padding: 10px 15px;
	text-align: center;
	text-decoration: none;
	display: inline-block;
	font-size: 15px;
	margin: 4px 2px;
	cursor: pointer;
}

.content {
	color: #555555;
	font-family: 'Helvetica Neue', sans-serif;
	font-size: 15px;
	font-weight: 80;
	line-height: 20px;
	letter-spacing: 1px;
	padding: 0 0 40px;
	border-bottom: double #555;
}

.borderline {
	padding-top: 20px;
	border-bottom: 3px dashed #ccc;
}

.content1 {
	color: #555555;
	font-family: 'Helvetica Neue', sans-serif;
	font-size: 15px;
	font-weight: 80;
	line-height: 20px;
	letter-spacing: 1px;
	padding: 0 0 20px;
}

.timeshadow {
	text-shadow: 2px 2px 15px red;
}

/* List to display horizontally  */
ul {
	list-style-type: square;
}

li {
	float: left;
	margin: auto;
	padding-right: 20px;
	width: 20%;
}
</style>

</head>
<body>
	<!-- Refer to developer comments for development logic -->
	<table>
		<!-- Available sessions will be displayed upon form submit -->
		<!-- Available sessions is based on availability of sessions by checking against booking data -->
		<!-- For that particular date, sessions that are not booked or have remaining allowance for booking(CapPerSession) will be displayed-->
		<form:form method="POST"
			action="${pageContext.request.contextPath}/facility/facilitypage">
			<tr>
				<td><b>BookingDate: </b></td>
				<!-- Date input with jQuery datepicker -->
				<%-- Display selected date if date is selected --%>
				<td><input type="text" name="bookingDate" id="datepicker"
					value="${availableSessions.getBookingDate()}" /></td>
				<%-- Upon submit, retrieve bookingDate value via POST --%>
				<td><input type="submit" value="Search" class="button" /></td>
				<td><b><span id="time" class="timeshadow"></span></b></td>
			</tr>
		</form:form>

		<%-- Show validator string if booking date is invalid --%>
		<c:if test="${not empty nullflag}">
			<tr>
				<td colspan=4><font color="red"><c:out
							value="Invalid booking date, please use calender" /></font></td>
			</tr>
			<%-- Show validator string if booking date is before today --%>
		</c:if>
		<c:if test="${not empty timetravellerflag}">

			<tr>
				<td colspan=4><font color="red"><c:out
							value="Hold there timetraveller, you can't book a date from the past!" /></font></td>

			</tr>
		</c:if>
	</table>

	<!-- Displays each facility information as a table per facility -->
	<%-- Creates a table foreach facility inside facilities(arraylist of facility) --%>
	<%-- For each table, display relevant facility information --%>
	<c:forEach var="facility" items="${facilities}">
		<div class="box">
			<table>
				<tr class="toprow">
					<td class="imagecolumn">
						<%-- part of uri path uses the same name(in lower case) as facility name --%>
						<img
						src="<c:url value="/image/images/${facility.facilityName.toLowerCase()}.jpg"/>"
						class="image">
					</td>
					<td class="detailscolumn">
						<table>
							<tr valign="top">
								<td valign="top"><b> <c:out
											value="Facility:  ${facility.facilityName}" /></b></td>
							</tr>
							<tr>
								<td valign="top">
									<table>
										<tr>
											<td class="content1">Location: ${facility.location}</td>
										</tr>
										<tr>
											<td class="content">${facility.facilityDescription}</td>
										</tr>

									</table>
								</td>
							</tr>
							<tr valign="bottom">

								<!-- Go to booking page with the seleced facility and booking date -->
								<%-- In the table, hidden input with value is used in this form to log bookingDate and facilityId --%>
								<%-- Upon submit, bookingDate and facilityId will be passed to the booking controller via POST --%>
								<%-- Booking date is a parsed Date into a formatted String in dd/MM/yyyy to accommodate booking controller date formatting --%>
								<form:form method="POST" modelAttribute="facility"
									action="${pageContext.request.contextPath}/booking/choose">
									<td colspan=2 valign="bottom"><input type="hidden"
										name="facilityId" value="${facility.facilityId}" /> <input
										type="hidden" name="bookingDate" value="${bookingDate}" /> <%-- Don't show booking button if bookingDate is not valid or null --%>
										<c:if test="${empty nullflag}">
											<c:if test="${empty timetravellerflag}">
												<c:if test="${not empty bookingDate}">
													<input type="submit" value="BOOK NOW" class="button" />
												</c:if>
											</c:if>
										</c:if></td>
								</form:form>
							</tr>



						</table>
					</td>
				</tr>
				<tr>
					<td class="borderline" colspan=2><b>Available Sessions: </b></td>
				</tr>
				<tr>
					<td colspan=2><ul>
							<!-- Display list of available session horizontally -->
							<%-- For each sessions in list of available sessions, list it horizontally --%>
							<c:if test="${empty nullflag}">
								<c:if test="${empty timetravellerflag}">
									<c:forEach var="sessions"
										items="${availableSessions.getFacilityAvailableSessions().get(facility)}">
										<%-- Format the string to display start time to end time (e.g. 09:00 - 10:00) and to remove the seconds at the back --%>
										<li>${sessions.getStartTime().substring(0,5)}-${sessions.getEndTime().substring(0,5)}</li>
									</c:forEach>
								</c:if>
							</c:if>
						</ul></td>
				</tr>
			</table>
		</div>
	</c:forEach>
</body>
</html>