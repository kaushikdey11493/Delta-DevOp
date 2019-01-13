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
a{
	text-decoration:none;
	color:white
}
.addbtn:hover{
	cursor:pointer;
	background:#2BDAB6;
	box-shadow:7px 7px #C5ECDD;
}

.empview{
	width:80%;
	background:#C5ECDD;
	margin:auto;
	font-weight:bold;
	font-size:20px;
	padding:20px;
}
table .view{
	background:#00C97D;
	text-align:center;
	color:white;
	border-radius:5px;
	padding:5px;
	width:110px;
	margin:50px;
}
table .remove{
	background:#FE7A1F;
	text-align:center;
	color:white;
	border-radius:5px;
	padding:5px;
	width:110px;
	margin:50px;
}

</style>
<%@ page import="java.util.*,com.delta.admincontrollers.models.*" %>
<script type="text/javascript">
function confirm1(id)
{
	var obj=document.getElementById(id);
	var x=confirm("Are you sure want to delete ?");
	if(!x)
	{
		obj.href="/administrator/employee"; 
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
  	<div class="addbtn">
  		<a href="/administrator/employee/add">
  	  	Add Employee  		
  		</a>
  	</div>
  	<br><br>
  	<table class="empview" >
	  	<tr><td>Employee Id/Email :</td><td>Employee Name :</td><td></td><td></td></tr>
	  	<%
	  	EmployeeList emplist=(EmployeeList)request.getAttribute("emplist");
	  	List<Employee> list=emplist.getList();
	  	int i=0;
	  	for(Employee emp : list)
	  	{
	  	%>
	  	<tr>
	  		<td><%=emp.getEmail() %></td><td><%=emp.getName() %></td><td class="view"><a href="/administrator/employee/view?id=<%=emp.getEmail()%>">VIEW</a></td>
	  		<td class="remove"><a id="<%=emp.getEmail() %>" href="/administrator/employee/remove?email=<%=emp.getEmail()%>" onclick="confirm1('<%=emp.getEmail()%>')">REMOVE</a></td>
	  	</tr>
  		<%
  			i++;
  		}
	  	%>
	 </table>
</body>
</html>