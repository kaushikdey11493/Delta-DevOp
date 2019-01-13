<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.*,com.delta.admincontrollers.models.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Delta Web Store</title>
<style>
body {
font-family: Verdana, sans-serif;
}
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
div.banner {
    margin: 2% 2%;
    border: none;
    float: left;
    width: 20%;
}

div.banner:hover {
    box-shadow: 10px 10px 5px #D9E9EA;
}

div.banner img {
    width: 100%;
    height: 200px;
}

div.desc {
    padding: 15px;
    text-align: center;
    color:#076B8E;
    font-weight:bold;
    font-size:85%;
}
a{
    text-decoration:none;
}
</style>
</head>
<body>
<div class="welcome">
	Welcome To Delta Web Store
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
<br><br>
<%
	CategoryList catlist=(CategoryList)request.getAttribute("catlist");
	List<Category> list=catlist.getList();
	for(Category cat : list)
	{
%>
		<div class="banner">
		  	<a href="/<%=cat.getParent()%>/<%=cat.getCatid()%>">
		    	<img src="<%=cat.getImgsrc() %>" alt="Electronics Appliances" >
		  		<div class="desc"><%=cat.getCatname() %></div>
		  	</a>
		</div>
<%
	}
%>
</body>
</html>