<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<style>

 

.dropdown {
    float: left;
    overflow: hidden;
}

.dropdown .dropbtn {
    font-size: 16px;    
    border: none;
    outline: none;
    color: white;
    padding: 14px 16px;
    background-color: inherit;
    font-family: inherit;
    margin: 0;
}

.navbar a:hover, .dropdown:hover .dropbtn {
    background-color: red;
}


</style>
<title>Insert title here</title>
</head>
<body>
<h1>Welcome to Booking Page</h1>
<br>
<div>
<select name="sel">
<option value="Alto">Alto</option>
<option value="Esteem">Esteem</option>
<option value="Honda City">Honda City</option>
<option value="Chevrolet">Chevrolet</option>
</select>
<br><br>
</div>
<div>
<table><tr><td><input type="date" class="form-control" id="date" placeholder="Select value"><td><td></td></tr></table>
</div><br><br>
<div>
<input type="button" value="Search" />
</div>
</body>
</html>