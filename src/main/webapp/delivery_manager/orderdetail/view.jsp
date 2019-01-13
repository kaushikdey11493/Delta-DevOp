<%@page import="java.util.*,com.delta.admincontrollers.models.*,java.net.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Delta Administration</title>
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
	width:95%;
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
	width:150px;
	margin-bottom:20px;
}
.update{
	margin:auto;
	background:green;
	text-align:center;
	color:white;
	border-radius:5px;
	padding:5px;
	width:150px;
	margin-bottom:20px;
}
a{
	text-decoration:none;
	color:white;
}
.addbtn{
	color:white;
	margin:auto;
	padding:20px;
	font-weight:bold;
	font-size:22px;
	width:200px;
	border-radius:7px;
	background:#0B98DA;
	text-align:center;
}
.addbtn:hover{
	cursor:pointer;
	background:#07B3C9;
}
</style>
<script type="text/javascript">
function confirm1()
{
	var obj=document.getElementById("remove");
	var x=confirm("Are you sure want to delete ?");
	if(!x)
	{
		obj.href="/administrator/product"; 
	}
}
function check()
{
	var file=document.getElementById("files");
	if(file.files.length==0)
		alert("No files choosen");
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
  		<li><a href="/delivery_manager/orderdetail" style="color:black">Order Details</a></li>
  		<li style="float:right"><a href="/delivery_manager" style="color:black">Hello ${deltaLoginDetails.name}</a></li>
  	</ul>
  	<br><br>
  	<div class="detail">
  		<p style="text-align:left;margin-left:30px;font-size:25px">Product Bill :</p>
  		<br>
  		<%
  		OrderDetail order=(OrderDetail)request.getAttribute("order");
  		Product pro=(Product)request.getAttribute("pro");
  		UserInfo user=(UserInfo)request.getAttribute("user");
  		%>
  		<table>
  			<tr><td width="20%">Order ID </td><td>: <%=order.getOid() %></td></tr>
  			<tr><td width="20%">Customer Name </td><td>: <%=user.getName() %></td></tr>
  			<tr><td width="20%">Product Name </td><td>: <%=pro.getPname() %></td></tr>
  			<tr><td width="20%">Product Price </td><td>: <%=order.getPrice() %></td></tr>
  			<tr><td width="20%">Customer Contact Number </td><td>: <%=user.getPhone()%></td></tr>
  			<tr><td width="20%">Customer Address </td><td>: <%=user.getHouse_no()+" , "+user.getStreet_no()+" , "+user.getTown()+" , "+user.getCity()+" . "+"( Near By : "+user.getNearby()+" ) "+user.getState()+" , "+user.getCountry() %></td></tr>
  		</table>
  	</div>
  	
</body>
</html>