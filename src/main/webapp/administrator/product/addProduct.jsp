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
	var pid=document.getElementById('pid').value;
	var pname=document.getElementById('pname').value;
	var cid=document.getElementById('cid').value;
	var pdetails=document.getElementById('pdetails').value;
	var price=document.getElementById('price').value;
	var dprice=document.getElementById('dprice').value;
	var empid=document.getElementById('empid').value;
	var cat=document.getElementById('category').value;
	
	if(pid=='' || pname==''||cid==''||pdetails==''||price==''||dprice==''||empid==''||cat=='')
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
function proid1()
{
	var pname=document.getElementById('pname');
	var pid=document.getElementById('pid');
	var category=document.getElementById('category');
	if(category.value=='')
	{
		pid.value=pname.value;
	}
	else if(pname.value=='')
		pid.value=category.value;
	else
		pid.value=category.value+"-"+pname.value;
}
function proid2()
{
	var pname=document.getElementById('pname');
	var category=document.getElementById('category');
	var pid=document.getElementById('pid');
	if(category.value!='')
	{
		if(pid.value=="")
			pid.value=category.value;
		else
			pid.value=category.value+"-"+pname.value;
	}
	else
		pid.value=pname.value;
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
  	<form id="frm" name="frm" action="/administrator/product/add/verify">
		<div class="inputbox">
			<h1>Product Register Form</h1>
			<p>Enter Product Id : </p>
			<input type="text" name="pid" id="pid" placeholder="Enter Product Id" autofocus  autocomplete='off' readonly>
			<br><br>
			<p>Enter Product Name : </p>
			<input type="text" name="pname" id="pname" placeholder="Enter Product Name" autocomplete='off' onkeyup="proid1()">
			<br><br>
			<p>Select Company Id : </p>
			<select name="cid" id="cid">
    			<option value="">Choose Company</option>
    			<%
    			String empid=((Employee)session.getAttribute("deltaLoginDetails")).getEmail();
    			CompanyList complist=(CompanyList)request.getAttribute("complist");
    			List<Company> list1=complist.getList();
    			for(Company comp : list1)
    			{
    			%>
    			<option value="<%=comp.getCid() %>"><%=comp.getCname() %></option>
    			<%
    			}
    			%>
    		</select>
			<br><br>
			<p>Enter Product Details : </p>
			<textarea name="pdetails" id="pdetails" placeholder="Enter Details" autocomplete='off' form="frm" width="100px" rows=6></textarea>
			<br><br>
			<p>Enter Price : </p>
			<input type="number" name="price" id="price" placeholder="Enter Price">
			<br><br>
			<p>Enter Discount Price (if any) : </p>
			<input type="number" name='dprice' id="dprice" value="0" placeholder="Enter Discount Price">
			<br><br>
			<p>Employ Id : </p>
			<input type="text" name="empid" id="empid" value="<%=empid%>" placeholder="Enter Employee Id" readonly>
			<br><br>
			<p>Select Product Category : </p>
			<select name="category" id="category" onchange="proid2()">
    			<option value="">Choose Category</option>
    			<%
    			CategoryList catlist=(CategoryList)request.getAttribute("catlist");
    			List<Category> list2=catlist.getList();
    			for(Category cat : list2)
    			{
    			%>
    				<option value="<%=cat.getCatid()%>"><%=cat.getCatname() %></option>
    			<%
    			}
    			%>
    		</select><br><br>
			<br><br>
			<input type='button' value='Add' onclick="check()">
		</div>
	</form>
</body>
</html>