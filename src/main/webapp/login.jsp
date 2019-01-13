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
	height:470px;
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
.inputbox a:hover {
	border-bottom:2px solid #5D0DA9;
	color:#B472F2;
}
.inputbox input[type='email'],input[type='password']{
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

a{
text-decoration:none;
}
</style>
<script type="text/javascript">
function check()
{
	var email=document.getElementById('email').value;
	var pass=document.getElementById('pass').value;
	if(email=='' || pass=='')
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
	<div class='welcome'>
		Welcome To Delta Web Store
	</div>
	<ul>
  		<li><a href="/" style="color:black">Home</a></li>
  		<li><a href="/electronics" style="color:black">Electronics & Appliances</a></li>
  		<li><a href="/men's_wear" style="color:black">Men</a></li>
  		<li><a href="/women's_wear" style="color:black">Women</a></li>
  		<li><a href="/home_&_furniture" style="color:black">Home & Furniture</a></li>
  		<li style="float:right;"><a href="#" style="color:red">Cart</a></li>
  		<li style="float:right;"><a href="/login" style="color:black;">Login & Signup</a></li>
	</ul>
	<%
		if(session.getAttribute("error")!=null)
		{
	%>
			<p style="color:#FF7D23;text-align:center;font-weight:bold">*** Wrong email or password ***</p>
	<%
			session.removeAttribute("error");
		}
	%>
	<form  name="frm" action="/loginVerify">
		<div class="inputbox">
			<h1>Login</h1>
			<p>Enter Email : </p>
			<input type="email" name="email" id="email" placeholder="Enter email" autofocus  autocomplete='off'>
			<br><br>
			<p>Enter Password : </p>
			<input type="password" name="pass" id="pass" placeholder="Enter password">
			<br><br><br><br>
			<input type='button' value='Login' onclick="check()">
			<p style="text-align:center"><a href="/register" style="font-size:85%">Don't have an account ? Register</a></p>
		</div>
	</form>
</body>
</html>