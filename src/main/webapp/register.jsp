<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Delta Web Store</title>
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
	height:1600px;
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
	var pass1=document.getElementById('password').value;
	var pass2=document.getElementById('pass1').value;
	var country=document.getElementById('country').value;
	var state=document.getElementById('state').value;
	var city=document.getElementById('city').value;
	var town=document.getElementById('town').value;
	var name=document.getElementById('name').value;
	var phone=document.getElementById('phone').value;
	if(country=='' || state=='' || city=='' || town=='' || email=='' || pass1=='' || pass2=='' || name=='' || phone=='' || pass1!=pass2)
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
  		<li><a href="/" style="color:black">Home</a></li>
  		<li><a href="/electronics" style="color:black">Electronics & Appliances</a></li>
  		<li><a href="/men's_wear" style="color:black">Men</a></li>
  		<li><a href="/women's_wear" style="color:black">Women</a></li>
  		<li><a href="/home_&_furniture" style="color:black">Home & Furniture</a></li>
  		<li style="float:right;"><a href="/register" style="color:red">Cart</a></li>
  		<li style="float:right;"><a href="/login" style="color:black;">Login & Signup</a></li>
  	</ul>
  	<br><br>
  	<form  name="frm" action="/registerVerify">
		<div class="inputbox">
			<h1>Sign Up</h1>
			<p>* Enter Email : </p>
			<input type="email" name="email" id="email" placeholder="Enter email (Compulsory)" autofocus  autocomplete='off'>
			<br><br>
			<p>* Enter Name : </p>
			<input type="text" name="name" id="name" placeholder="Enter name (Compulsory)" autocomplete='off'>
			<br><br>
			<p>* Enter Phone Number : </p>
			<input type="number" name="phone" id="phone" placeholder="Enter Phone Number (Compulsory)" autocomplete='off'>
			<br><br>
			<p>* Enter Country : </p>
			<input type="text" name="country" id="country" placeholder="Enter Country (Compulsory)" autocomplete='off'>
			<br><br>
			<p>* Enter State : </p>
			<input type="text" name="state" id="state" placeholder="Enter State (Compulsory)" autocomplete='off'>
			<br><br>
			<p>* Enter City : </p>
			<input type="text" name="city" id="city" placeholder="Enter City (Compulsory)" autocomplete='off'>
			<br><br>
			<p>* Enter Town : </p>
			<input type="text" name="town" id="town" placeholder="Enter Town (Compulsory)" autocomplete='off'>
			<br><br>
			<p>Enter Street Name : </p>
			<input type="text" name="street_no" id="stno" placeholder="Enter Street Number" autocomplete='off'>
			<br><br>
			<p>Enter House Number : </p>
			<input type="text" name="house_no" id="houseno" placeholder="Enter Street Number" autocomplete='off'>
			<br><br>
			<p>Enter Nearby : </p>
			<input type="text" name="nearby" id="nearby" placeholder="Enter Nearby" autocomplete='off'>
			<br><br>
			<p>* Enter Password : </p>
			<input type="password" name="password" id="password" placeholder="Enter password  (Compulsory)">
			<p>* Re-Enter Password : </p>
			<input type="password" name='pass1' id="pass1" placeholder="Re-Enter password  (Compulsory)">
			<br><br><br><br>
			<input type='button' value='Sign Up' onclick="check()">
		</div>
	</form>
</body>
</html>