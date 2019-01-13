<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Delta Administration</title>
<%@ page import="java.util.*,com.delta.admincontrollers.models.*,java.net.*" %>
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

.catview{
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
		obj.href="/administrator/category"; 
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
	 	<a href="/administrator/category/add">
	   	Add Category 		
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
	
	<br><br>
  	<table class="catview">
  		<tr class="row" style="padding:20px">
  			<td></td>
  			<td width="250px" class="col">Category Id</td>
  			<td width="250px" class="col">Category Name</td>
  			<td width="250px" class="col">Category Parent</td>
  			<td></td>  			
  		</tr>
  		<%
  		CategoryList catlist=(CategoryList)request.getAttribute("catlist");
  		List<Category> list=catlist.getList();
  		for(Category cat : list)
  		{
  			%>
  		<tr class="row" style="padding:20px">
  		  	<td><img src="<%="http://localhost:8080/"+cat.getImgsrc()%>" alt="<%=cat.getImgsrc() %>" style="width:150px;height:150px;border-radius:75px"></td>
  			<td width="25%" class="col"><%=cat.getCatid() %></td>
  			<td width="25%" class="col"><%=cat.getCatname() %></td>
  			<%if( cat.getParent()==null | cat.getParent().equals(""))
  			{
  			%>
  				<td width="25%" class="col"><a href="#" style="text-decoration:none;">No Parent</a></td>
  			<%
  			}
  			else
  			{
  			%>
  			<td width="25%" class="col"><a href="#<%=cat.getParent()%>" style="text-decoration:none;"><%=cat.getParent()%></a></td>
  			<%
  			}
  			%>
  			<td width="12%" class="col"><div class="remove"><a id="<%=cat.getCatid()%>"  href="/administrator/category/remove?id=<%=URLEncoder.encode(cat.getCatid(), "UTF-8")%>" style="text-decoration:none" onclick="confirm1('<%=cat.getCatid()%>')">REMOVE</a></div></td>
  		</tr>
  		<%
  		}
  		%>
  	</table>
</body>
</html>