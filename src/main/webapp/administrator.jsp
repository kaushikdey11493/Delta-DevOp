<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Delta Administration</title>
<style type="text/css">
@charset "ISO-8859-1";
.welcome {
	color:white;
	background-color:#327FFF;
	font-weight:bold;
	text-align:center;
	font-size:24px;
	padding:25px;
	margin-bottom:25px;
}
ul {
    list-style-type: none;
    margin: 0;
    padding: 0;
    overflow: hidden;
    background-color: #E2FDFF;
}

li {
    float: left;
    font-weight:bold;
    color:black;
}

li a {
    display: block;
    color: white;
    text-align: center;
    padding: 25px;
    text-decoration: none;
}

li a:hover {
    background-color: #23DCEC;
}

.detail{
	font-weight:bold;
	font-size:20px;
	width:60%;
	margin-left:50px;
	padding:10px;
	background:#CBF6CD;
}
.logout{
	cursor:pointer
}

</style>
</head>
<body>
	<div class="welcome">
		Delta Web Administrator
	</div>
	<ul>
  		<li><a href="/administrator/employee" style="color:black">Employee</a></li>
  		<li><a href="/administrator/product" style="color:black">Products</a></li>
  		<li><a href="/administrator/category" style="color:black">Category</a></li>
  		<li><a href="/administrator/company" style="color:black">Reg. Companies</a></li>
  		<li><a href="/administrator/seeLog" style="color:black">Log Details</a></li>
  		<li style="float:right"><a href="/administrator" style="color:black">Hello ${deltaLoginDetails.name}</a></li>
  	</ul>
  	<br><br>
  	<div class="detail">
  		<table>
  			<tr><td>Administrator Name </td><td>: ${deltaLoginDetails.name}</td></tr>
  			<tr><td>Email Identification </td><td>: ${deltaLoginDetails.email}</td></tr>
  			<tr><td>Phone Number </td><td>: ${deltaLoginDetails.phone}</td></tr>
  			<tr><td>Address </td><td>: ${deltaLoginDetails.address}</td></tr>
  		</table>
  	</div>
  	<a href="/admin/logout"><button class="logout" style="border:none;background:#FF6C07;color:white;font-weight:bold;width:10%;padding:1%;margin:4%;font-size:20px">Log Out</button></a>
</body>
</html>