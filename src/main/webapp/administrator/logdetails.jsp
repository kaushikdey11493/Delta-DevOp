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

a{
	text-decoration:none;
	color:white
}

.logview{
	width:80%;
	background:#C5ECDD;
	margin:auto;
	font-weight:bold;
	font-size:20px;
	padding:20px;
}


</style>
<%@ page import="java.util.*,com.delta.admincontrollers.models.*" %>
<script type="text/javascript">
function confirm1()
{
	var obj=document.getElementById("remove");
	var x=confirm("Are you sure want to delete ?");
	if(!x)
	{
		obj.href="/administrator/updateProductManager"; 
	}
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
  	<br><br>
  	<table class="logview" >
	  	<tr><td>Date-Time :</td><td>Employee ID :</td></tr>
	  	<%
	  	LogList loglist=(LogList)request.getAttribute("loglist");
	  	List<AdminLog> list=loglist.getList();
	  	int i=0;
	  	for(AdminLog log : list)
	  	{
	  	%>
	  	<tr>
	  		<td><%=log.getDate_time() %></td><td><%=log.getEmail()%></td>
	  	</tr>
  		<%
  		}
	  	%>
	 </table>
</body>
</html>