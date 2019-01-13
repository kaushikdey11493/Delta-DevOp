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
	width:60%;
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
  		<li><a href="/administrator/employee" style="color:black">Employee</a></li>
  		<li><a href="/administrator/product" style="color:black">Products</a></li>
  		<li><a href="/administrator/category" style="color:black">Category</a></li>
  		<li><a href="/administrator/company" style="color:black">Reg. Companies</a></li>
  		<li><a href="/administrator/seeLog" style="color:black">Log Details</a></li>
  		<li style="float:right"><a href="/administrator" style="color:black">Hello ${deltaLoginDetails.name}</a></li>
  	</ul>
  	<br><br>
  	<div class="detail">
  		<p style="text-align:left;margin-left:30px;font-size:25px">Product Details :</p>
  		<br>
  		<table>
  			<tr><td>Product ID </td><td>: ${product.pid}</td></tr>
  			<tr><td>Product Name </td><td>: ${product.pname}</td></tr>
  			<tr><td>Company Name</td><td>: ${company.cname}</td></tr>
  			<tr><td>Product Details </td><td>: ${product.pdetails}</td></tr>
  			<tr><td>Product Price </td><td>: ${product.price}</td></tr>
  			<tr><td>Product Discount Price </td><td>: ${product.dprice}</td></tr>
  			<tr><td>Employee ID </td><td>: ${employee.email}</td></tr>
  			<tr><td>Product Category </td><td>: ${product.category}</td></tr>
  		</table>
  		<br><br>
  		<p class="update"><a href="/administrator/product/update?id=${product.pid}" style="font-size:24px">Update</a></p>
  		<br>
  		<p class="remove"><a id="remove" href="/administrator/product/remove?id=${product.pid}" style="font-size:24px" onclick="confirm1()">REMOVE</a></p>
  	</div>
  	<br><br><br><br>
  	<form name="frm" action="/administrator/product/addImage" enctype="multipart/form-data">
  	<table style="margin:auto;background:#B3EAF1;padding:2%;width:90%">
  	<tr>
  		<td style="color:#086B9D;font-size:22px;font-weight:bold">Product ID :</td>
  		<td><input type="text" name="pid" value="${product.pid}" style="color:#086B9D;font-size:22px;background:#B3EAF1;font-weight:bold" readonly></td>
  		<td><input type="file" id="files" name="files" style="color:#086B9D;font-size:22px;background:#B3EAF1;font-weight:bold" multiple></td>
  		<td class="addbtn" onclick="check()">Add Product Image </td>
	</tr>
	</table>
	</form>
	<br><br><br><br>
	<%
	ImageList imglist=(ImageList)request.getAttribute("imglist");
	List<Image> list=imglist.getList();
	Product pro=(Product)request.getAttribute("product");
	String dir="http://localhost:8080/";
	for(Image img : list)
	{
	%>
  	<div style="width:27%;border:1px solid #E6520C;margin:3%;float:left">
  		<img alt="no image" height="260px" src="<%="http://localhost:8080/"+img.getImgsrc() %>" width="100%">
  		<a href="/administrator/product/removeImage?id=<%=img.getImgsrc()%>&pid=<%=URLEncoder.encode(pro.getPid(), "UTF-8")%>"><p style="padding:5%;padding-left:40%;color:white;background-color:#E6520C;font-size:20px">Remove</p></a>
  	</div>
  	<%
	}
  	%>
</body>
</html>