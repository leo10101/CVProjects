<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<html>
<head>
<title>Home</title>
<style>
body {
	background-image: url("image/wall.jpg");
	background-size: cover;
}
h2 {
	color: white;
	text-shadow: 2px 2px #008000;
	letter-spacing: 3px;
	text-align: center;
}

#p01 {
	width: 930px;
	height: 200px;
}

#p02 {
	width: 220px;
	height: 155px;
	float: right;
	margin-right: 12px;
}

img {
	border: 4px solid #000000;
}
</style>

</head>

<body>
	<br>
	<div id="p01">

		<div id="p02">
			<img src="image/facility.jpg" width="215" height="150">
		</div>
		<div id="p02" style="">
			<img src="image/football.jpg" width="215" height="150">
		</div>
		<div id="p02">
			<img src="image/swimming.jpg" width="215" height="150">
		</div>
		<div id="p02">
			<img src="image/basketball.jpg" width="215" height="150">
		</div>
<h2>Welcome from Club Application</h2>
	</div>
	
</body>
</html>
