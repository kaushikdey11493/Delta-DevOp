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
	margin:auto;
	padding:10px;
	background:#CBF6CD;
}
.remove{
	margin:auto;
	background:#FE7A1F;
	text-align:center;
	color:white;
	border-radius:5px;
	padding:5px;
	width:110px;
	margin-bottom:20px;
}
a{
	text-decoration:none;
	color:white;
}
</style>
<script type="text/javascript">
function confirm1()
{
	var obj=document.getElementById("remove");
	var x=confirm("Are you sure want to delete ?");
	if(!x)
	{
		obj.href="#"; 
	}
}
</script>
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
  		<p style="text-align:left;margin-left:30px;font-size:25px">Company Details :</p>
  		<br>
  		<table>
  			<tr><td>Company ID </td><td>: ${comp.cid}</td></tr>
  			<tr><td>Company Name </td><td>: ${comp.cname}</td></tr>
  			<tr><td>Comapany Website </td><td>: <a href="${comp.cwebsite}" style="color:blue" target="_blank">${comp.cwebsite}</a></td></tr>
  			<tr><td>Number of products </td><td>: ${comp.noofpro}</td></tr>
  			<tr><td>Country </td><td>: ${comp.country}</td></tr>
  		</table>
  		<br>
  		<p class="remove"><a id="remove" href="/administrator/company/remove?id=${comp.cid}" onclick="confirm1()">REMOVE</a></p>
  	</div>
</body>
</html>