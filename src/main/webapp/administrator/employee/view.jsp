<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Delta Administration</title>
<%@ page import="com.delta.admincontrollers.models.*" %>
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
		obj.href="/administrator/employee"; 
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
  		<%
  		Employee emp=(Employee)request.getAttribute("employee");
  		String jobid="";
  		if(emp.getJobid().equals("administrator"))
  			jobid="Administrator";
  		else if(emp.getJobid().equals("product_manager"))
  			jobid="Product Manager";
  		else if(emp.getJobid().equals("product_delivery_manager"))
  			jobid="Product Delivery Manager";
  			
  		%>
  			
  		<p style="text-align:left;margin-left:30px;font-size:25px;text-transform: capitalize;"><%=jobid %> :</p>
  		<br>
  		<table>
  		<tr><td>Name </td><td>: ${employee.name}</td></tr>
  			<tr><td>Email Identification </td><td>: ${employee.email}</td></tr>
  			<tr><td>Phone Number </td><td>: ${employee.phone}</td></tr>
  			<tr><td>Address </td><td>: ${employee.address}</td></tr>
  		</table>
  		<br>
  		<p class="remove"><a id="remove" href="/administrator/employee/remove?email=${employee.email}" onclick="confirm1()">REMOVE</a></p>
  	</div>
</body>
</html>