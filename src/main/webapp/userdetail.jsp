<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Delta Administration</title>
<style type="text/css">
body {font-family: Verdana, sans-serif;}
.welcome {
	color:white;
	background-color:#327FFF;
	font-weight:bold;
	text-align:center;
	font-size:24px;
	padding:25px;
	margin-bottom:25px;
}
.inputbox{
	background:#C2B1E7;
	color:black;
	width:400px;
	height:1550px;
	margin:10% 35%;
	margin-top:50px;
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
	padding:20px;
	font-weight:bold;
	font-size:24px;
	background:#8239BB;
	width:90%;
	font-family: sans-serif;
	color:white;
}
.inputbox input{
	width:90%;
	margin:1%;
	border:none;
	border-bottom:3px solid #3C2EB1;
	background:#DACCE7;
	font-size:18px;
	color:black;
	outline-style: none;
	border-radius:5px;
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
ul {
    list-style-type: none;
    margin: 0;
    padding: 0;
    overflow: hidden;
    background-color: #E2FDFF

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
	font-size:14px;
}

li a:hover {
    background-color: #23DCEC;
}
</style>
<script type="text/javascript">
function check()
{
	var email=document.getElementById('email').value;
	var pass=document.getElementById('password').value;
	var country=document.getElementById('country').value;
	var state=document.getElementById('state').value;
	var city=document.getElementById('city').value;
	var town=document.getElementById('town').value;
	var name=document.getElementById('name').value;
	var phone=document.getElementById('phone').value;
	if(country=='' || state=='' || city=='' || town=='' || email=='' || name=='' || phone=='' || pass=='')
		alert("Fill up the form correctly");
	else
	{
		document.frm.method="post";
		document.frm.submit();
	}
}
</script>
</head>
<body>
	<div class="welcome">
		Delta Web Administrator
	</div>
	<ul>
  		<li><a href="/" style="color:black">Home</a></li>
  		<li><a href="/electronics" style="color:black">Electronics & Appliances</a></li>
  		<li><a href="/men's_wear" style="color:black">Men</a></li>
  		<li><a href="/women's_wear" style="color:black">Women</a></li>
  		<li><a href="/home_&_furniture" style="color:black">Home & Furniture</a></li>
  		<%
  		if(session.getAttribute("deltaUser")==null)
  		{
  		%>
  		<li style="float:right;"><a href="/login" style="color:red">Cart</a></li>
  		<%
  		}
  		else
  		{
  		%>
  		<li style="float:right;"><a href="/cart" style="color:red">Cart</a></li>
  		<%
  		}
  		%>
  		
  		<%
  		if(session.getAttribute("deltaUser")==null)
  		{
  		%>
  		<li style="float:right;"><a href="/login" style="color:black;">Login & Signup</a></li>
  		<%
  		}
  		else
  		{
  		%>
  		<li style="float:right;"><a href="/userdetail" style="color:black;">Hello ${deltaUser.name }</a></li>
  		<%
  		}
  		%>
  	</ul>
  	<br>
  	<%
		if(session.getAttribute("error")!=null)
		{
	%>
			<p style="color:#FF7D23;text-align:center;font-weight:bold">*** Wrong password ***</p>
	<%
			session.removeAttribute("error");
		}
	%>
	<%
		if(session.getAttribute("success")!=null)
		{
	%>
			<p style="color:green;text-align:center;font-weight:bold">Data Successfully Stored</p>
	<%
			session.removeAttribute("success");
		}
	%>
	<br>
  	<form  name="frm" action="/userdetailVerify">
		<div class="inputbox">
			<h1>User Details</h1>
			<p>* Enter Email : </p>
			<input type="email" name="email" id="email" placeholder="Enter email (Compulsory)" autofocus  autocomplete='off' value="${deltaUser.email }" readonly>
			<br><br>
			<p>* Enter Name : </p>
			<input type="text" name="name" id="name" placeholder="Enter name (Compulsory)" autocomplete='off' value="${deltaUser.name }" readonly>
			<br><br>
			<p>* Enter Phone Number : </p>
			<input type="number" name="phone" id="phone" placeholder="Enter Phone Number (Compulsory)" autocomplete='off' value="${deltaUser.phone }">
			<br><br>
			<p>* Enter Country : </p>
			<input type="text" name="country" id="country" placeholder="Enter Country (Compulsory)" autocomplete='off' value="${deltaUser.country }">
			<br><br>
			<p>* Enter State : </p>
			<input type="text" name="state" id="state" placeholder="Enter State (Compulsory)" autocomplete='off' value="${deltaUser.state }">
			<br><br>
			<p>* Enter City : </p>
			<input type="text" name="city" id="city" placeholder="Enter City (Compulsory)" autocomplete='off' value="${deltaUser.city }">
			<br><br>
			<p>* Enter Town : </p>
			<input type="text" name="town" id="town" placeholder="Enter Town (Compulsory)" autocomplete='off' value="${deltaUser.town }">
			<br><br>
			<p>Enter Street Name : </p>
			<input type="text" name="street_no" id="stno" placeholder="Enter Street Number" autocomplete='off' value="${deltaUser.street_no }">
			<br><br>
			<p>Enter House Number : </p>
			<input type="text" name="house_no" id="houseno" placeholder="Enter Street Number" autocomplete='off' value="${deltaUser.house_no }">
			<br><br>
			<p>Enter Nearby : </p>
			<input type="text" name="nearby" id="nearby" placeholder="Enter Nearby" autocomplete='off' value="${deltaUser.nearby }">
			<br><br>
			<p>* Enter Password To Save : </p>
			<input type="password" name="password" id="password" placeholder="Enter password  (Compulsory)">
			<br><br><br>
			<input type='button' value='Save' onclick="check()">
			<br><br>
			<a href="/logout"><input type='button' value='Log Out'></a>
		</div>
	</form>
</body>
</html>