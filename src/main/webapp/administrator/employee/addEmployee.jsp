<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Delta Administration</title>
<link rel="stylesheet" type="text/css" href="addEmployee.css">
<script type="text/javascript">
function check()
{
	var email=document.getElementById('email').value;
	var pass1=document.getElementById('password').value;
	var pass2=document.getElementById('pass1').value;
	var addr=document.getElementById('address').value;
	var name=document.getElementById('name').value;
	var phone=document.getElementById('phone').value;
	if(email=='' || pass1=='' || pass2=='' ||addr=='' || name=='' || phone=='' || pass1!=pass2)
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
  	<form  name="frm" action="/administrator/employee/add/verify">
		<div class="inputbox">
			<h1>Employee Form</h1>
			<p>Enter Email : </p>
			<input type="email" name="email" id="email" placeholder="Enter email" autofocus  autocomplete='off'>
			<br><br>
			<p>Enter Name : </p>
			<input type="text" name="name" id="name" placeholder="Enter name" autocomplete='off'>
			<br><br>
			<p>Enter Phone Number : </p>
			<input type="number" name="phone" id="phone" placeholder="Enter Phone Number" autocomplete='off'>
			<br><br>
			<p>Enter Address : </p>
			<input type="text" name="address" id="address" placeholder="Enter Address" autocomplete='off'>
			<br><br>
			<p>Enter Job Id : </p>
			<select name="jobid">
    			<option value="administrator">Administrator</option>
    			<option value="product_manager">Product Manager</option>
   				<option value="product_delivery_manager">Product Delivery Manager</option>
    		</select>
			<br><br>
			<p>Enter Password : </p>
			<input type="password" name="password" id="password" placeholder="Enter password">
			<p>Re-Enter Password : </p>
			<input type="password" name='pass1' id="pass1" placeholder="Re-Enter password">
			<br><br><br><br>
			<input type='button' value='Add' onclick="check()">
		</div>
	</form>
</body>
</html>