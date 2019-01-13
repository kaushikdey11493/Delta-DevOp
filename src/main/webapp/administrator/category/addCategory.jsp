<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Delta Administration</title>
<%@page import="java.util.*,com.delta.admincontrollers.models.*" %>
<link rel="stylesheet" type="text/css" href="addcat.css">
<script type="text/javascript">
function check()
{
	var catid=document.getElementById('catid').value;
	var catname=document.getElementById('catname').value;
	if(catid!='' && catname!='')
	{
		document.frm.method="post";
		document.frm.submit();
	}
	else
	{
		alert("Fill up the form correctly");
	}
}
function catid1()
{
	var catname=document.getElementById('catname');
	var catid=document.getElementById('catid');
	var parent=document.getElementById('parent');
	if(parent.value=='')
	{
		catid.value=catname.value;
	}
	else if(catname.value=='')
		catid.value=parent.value;
	else
		catid.value=parent.value+"-"+catname.value;
}
function catid2()
{
	var catname=document.getElementById('catname');
	var parent=document.getElementById('parent');
	var catid=document.getElementById('catid');
	if(parent.value!='')
	{
		if(catid.value=="")
			catid.value=parent.value;
		else
			catid.value=parent.value+"-"+catname.value;
	}
	else
		catid.value=catname.value;
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
  	<form id="frm" name="frm" action="/administrator/category/add/verify" enctype="multipart/form-data">
		<div class="inputbox">
			<h1>Category Register Form</h1>
			<p>Enter Category Id : </p>
			<input type="text" name="catid" id="catid" placeholder="Enter Category Id" autofocus  autocomplete='off' readonly>
			<br><br>
			<p>Enter Category Name : </p>
			<input type="text" name="catname" id="catname" placeholder="Enter Category Name" autocomplete='off' onkeyup="catid1()">
			<br><br>
			<p>Select Image File (if it is not product category) : </p>
			<input type="file" name="imgsrc" id="imgsrc" placeholder="Enter Image">
			<br><br>
			<p>Select Parent (if it is not product category) : </p>
			<select name="parent" id="parent" onchange="catid2()">
    			<option value="">Choose Parent</option>
    			<%
    			CategoryList catlist=(CategoryList)request.getAttribute("catlist");
    			List<Category> list=catlist.getList();
    			for(Category cat : list)
    			{
    			%>
    				<option value="<%=cat.getCatid() %>"><%=cat.getCatname() %></option>
    			<%
    			}
    			%>
    		</select>
    		<br><br><br>
			<input type='button' value='Add' onclick="check()">
		</div>
	</form>
</body>
</html>