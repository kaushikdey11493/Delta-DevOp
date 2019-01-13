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

.center {
    font-weight:bold;
    font-size:20px;
    text-align:center;
    margin: auto;
    width: 40%;
    padding: 20px;
    margin-bottom:70px;
    text-decoration:none;
}
a{
    text-decoration:none;
    color:#FFFFFF;
   
}

.center:hover{
	box-shadow:7px 7px #BCE4E8;
}
</style> 
</head> 
<body>
	<div class='welcome'>
		Welcome To Delta Administration Login Page
	</div>
	<br>
	<%
		if(session.getAttribute("error")!=null)
		{
	%>
			<p style="color:#FF7D23;text-align:center;font-weight:bold">*** Wrong email or password ***</p>
	<%
			session.removeAttribute("error");
		}
	%>
	<br>		
	<div class="center" style="background-color:#FE5A1D">
		<a href="/administratorLogin">
			Login as Delta Web Administrator
		</a>
	</div>
	<br>
	<div class="center" style="background-color:#28CA43">
		<a href="/product_managerLogin">
			Login as Delta Web Product Manager
		</a>
	</div>
	<br>
	<div class="center" style="background-color:#39C8D6">
		<a href="/product_delivery_managerLogin">
			Login as Delta Web Product Delivery Manager
		</a>
	</div>
</body>
</html>