<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Delta Administration</title>
<style type="text/css">
.welcome {
	color:white;
	background-color:#327FFF;
	font-weight:bold;
	text-align:center;
	font-size:24px;
	padding:25px;
	margin-bottom:50px;
}
.inputbox{
	background:#C2B1E7;
	color:black;
	width:400px;
	height:450px;
	margin:10% 32%;
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
		Delta Administration Login Page
	</div>
	
	<form  name="frm" action="<%=session.getAttribute("delta-login")%>">
		<div class="inputbox">
			<h1>Login</h1>
			<p>Enter Email : </p>
			<input type="email" name="email" id="email" placeholder="Enter email" autofocus  autocomplete='off'>
			<br><br>
			<p>Enter Password : </p>
			<input type="password" name="pass" id="pass" placeholder="Enter password">
			<br><br><br><br>
			<input type='button' value='Login' onclick="check()">
		</div>
	</form>
</body>
</html>