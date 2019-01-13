<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Delta Administration</title>
<%@ page import="java.util.*,com.delta.admincontrollers.models.*" %>
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

.addbtn{
	color:white;
	margin:auto;
	padding:20px;
	font-weight:bold;
	font-size:25px;
	width:300px;
	border-radius:7px;
	background:#13E501;
	text-align:center;
}
div a{
	text-decoration:none;color:white
}
.addbtn:hover{
	cursor:pointer;
	background:#2BDAB6;
	box-shadow:7px 7px #C5ECDD;
}

.compview{
	background:#C5ECDD;
	margin:auto;
	width:90%;	
} 

.col{
	text-align:center;
	padding:5px;
	font-weight:bold;
	font-size:18px;
	
}

.view{
	background:#00C97D;
	text-align:center;
	color:white;
	border-radius:5px;
	padding:20px 0px;
	width:110px;
}  


  
.remove{ 
	background:#FE7A1F;
	text-align:center;
	color:white;
	border-radius:5px;
	padding:20px 0px;
	width:110px;
}

</style>
</head>
<script type="text/javascript">
function confirm1(id)
{
	var obj=document.getElementById(id);
	var x=confirm("Are you sure want to delete ?");
	if(!x)
	{
		obj.href="/administrator/company"; 
	}
}

</script>
<body>
	<div class="welcome">
		Delta Web Administrator
	</div>
	<ul>
  		<li><a href="/administrator/employee" style="color:black;">Employee</a></li>
  		<li><a href="/administrator/product" style="color:black">Products</a></li>
  		<li><a href="/administrator/category" style="color:black">Category</a></li>
  		<li><a href="/administrator/company" style="color:black">Reg. Companies</a></li>
  		<li><a href="/administrator/seeLog" style="color:black">Log Details</a></li>
  		<li style="float:right"><a href="/administrator" style="color:black">Hello ${deltaLoginDetails.name}</a></li>
  	</ul>
  	<br><br>
  	<div class="addbtn" >
	 	<a href="/administrator/company/add">
	   	Add Company 		
		</a>
	</div>
	<br>
	<%
	if(session.getAttribute("error")!=null)
	{
	%>
		<div style="color:red;text-align:center;font-weight:bold;font-size:18px">Cannot be deleted child exist</div>
	<%
		session.removeAttribute("error");
	}
	%>
	<br>
  	<table class="compview">
  		<tr class="row" style="padding:20px">
  			<td width="34%" class="col">Company Name</td>
  			<td width="13%" class="col">Country</td>
  			<td width="35%" class="col">Company Website (Link)</td>
  			<td width="9%" class="col"></td>
  			<td width="9%" class="col"></td>
  		</tr>
  		<%
  		CompanyList complist=(CompanyList)request.getAttribute("complist");
  		List<Company> list=complist.getList();
  		for(Company comp : list)
  		{
  		%>
  		<tr class="row" style="padding:20px">
  			<td width="34%" class="col"><%=comp.getCname() %></td>
  			<td width="13%" class="col"><%=comp.getCountry() %></td>
  			<td width="35%" class="col"><a href="<%=comp.getCwebsite()%>" style="text-decoration:none;" target="_blank"><%=comp.getCwebsite()%></a></td>
  			<td width="9%" class="col"><div class="view"><a href="/administrator/company/view?id=<%=comp.getCid()%>" style="text-decoration:none;">VIEW</a></div></td>
  			<td width="9%" class="col"><div class="remove"><a id="<%=comp.getCid() %>" href="/administrator/company/remove?id=<%=comp.getCid()%>" style="text-decoration:none;" onclick="confirm1('<%=comp.getCid()%>')">REMOVE</a></div></td>
  		</tr>
  		<%
  		}
  		%>
  	</table>
</body>
</html>