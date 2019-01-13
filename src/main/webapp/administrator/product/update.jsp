<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Delta Administration</title>
<%@page import="java.util.*,com.delta.admincontrollers.models.*" %>
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
.inputbox{
	background:#C2B1E7;
	color:black;
	width:500px;
	height:1350px;
	margin:auto;
	text-align:center;
}
.inputbox p{
	font-weight:bold;
	font-family: sans-serif;
	text-align:left;
	margin-left:20px;
	font-size:20px;
	color:white;
}

.inputbox h1 {
	padding:25px;
	font-weight:bold;
	font-size:24px;
	background:#8239BB;
	width:90%;
	font-family: sans-serif;
	color:white;
}
.inputbox input,select,textarea{
	width:90%;
	margin:1%;
	border:none;
	border-bottom:3px solid #3C2EB1;
	background:#DACCE7;
	font-size:18px;
	color:black;
	outline-style: none;
	border-radius:5px;
	padding:5px;
}
input[type='button']{
	width:90%;
	height:50px;
	font-size:18px;
	color:#fff;
	background:#B6249E;
	border:none;
	font-weight:bold;
	outline-style: none;
}
input[type='button']:hover{
	background: #8F77C5;
	cursor:pointer;
	outline-style: none;
}

</style>
<script type="text/javascript">
function check()
{
	var pname=document.getElementById('pname').value;
	var pdetails=document.getElementById('pdetails').value;
	var price=document.getElementById('price').value;
	var dprice=document.getElementById('dprice').value;
	
	if(pname==''||pdetails==''||price==''||dprice=='')
		alert("Fill up the form correctly");
	else
	{
		document.frm.method="post";
		document.frm.submit();
	}
}
function hel()
{
	alert('hel');
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
  	<form id="frm" name="frm" action="/administrator/product/update/verify">
		<div class="inputbox">
			<h1>Product Update</h1>
			<p>Product Id : </p>
			<input type="text" name="pid" id="pid" placeholder="Enter Product Id" autofocus  autocomplete='off' value="${product.pid}" readonly>
			<br><br>
			<p>Product Name : </p>
			<input type="text" name="pname" id="pname" placeholder="Enter Product Name" autocomplete='off' value="${product.pname}">
			<br><br>
			<p>Company Id : </p>
			<input type="text" name="cid" id="cid" placeholder="Enter Product Name" autocomplete='off' value="${company.cid}" readonly>
			<br><br>
			<p>Product Details : </p>
			<textarea name="pdetails" id="pdetails" placeholder="Enter Details" autocomplete='off' form="frm" width="100px" rows=6>${product.pdetails}</textarea>
			<br><br>
			<p>Product Price : </p>
			<input type="number" name="price" id="price" placeholder="Enter Price" value="${product.price}">
			<br><br>
			<p>Product Discount Price (if any) : </p>
			<input type="number" name='dprice' id="dprice" value="0" placeholder="Enter Discount Price" value="${product.dprice}">
			<br><br>
			<p>Employ Id : </p>
			<input type="text" name="empid" id="empid" placeholder="Enter Employee Id"  value="${product.empid}" readonly>
			<br><br>
			<p>Product Category : </p>
			<input type="text" name="category" id="category" placeholder="Enter Category" value="${product.category}" readonly>
			<br><br>
			<br><br>
			<input type='button' value='Update' onclick="check()">
		</div>
	</form>
</body>
</html>