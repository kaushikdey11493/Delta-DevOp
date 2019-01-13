<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Delta Administration</title>
<%@ page import="java.util.*,com.delta.admincontrollers.models.*,com.delta.admincontrollers.dao.*,java.net.*" %>
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

.proview{
	background:#C5ECDD;
	margin:auto;
	width:95%;	
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
		obj.href="/administrator/product"; 
	}
}

</script>
<body>
	<div class="welcome">
		Delta Web Administrator
	</div>
	<ul>
  		<li><a href="/delivery_manager/orderdetail" style="color:black;">Order Details</a></li>
  		<li style="float:right"><a href="/delivery_manager" style="color:black">Hello ${deltaLoginDetails.name}</a></li>
  	</ul>
  	<br><br>
  	<table class="proview">
  		<tr style="padding:20px">
  			<td width="15%" class='col'>Order ID</td>
  			<td width="15%" class="col">Customer Name</td>
  			<td width="40%" class="col">Product Name</td>
  			<td width="20%" class="col">Product Delivery Date</td>
  			<td width="10%" class="col"></td>
  		</tr>
  		<tr></tr>
  		<tr></tr>
  		<tr></tr>
  		<%
  		OrderList orderlist=(OrderList)request.getAttribute("orderlist");
  		List<OrderDetail> list=orderlist.getList();
  		ProductRepo prorepo=(ProductRepo)request.getAttribute("prorepo");
  		UserInfoRepo userrepo=(UserInfoRepo)request.getAttribute("userrepo");
  		for(OrderDetail order : list)
  		{
  			Product pro=prorepo.findById(order.getPid()).orElse(null);
  			UserInfo user=userrepo.findById(order.getUid()).orElse(null);
  		%>
  		
  		<tr class="row" style="padding:20px">
  			<td width="15%" class="col"><%=order.getOid() %></td>
  			<td width="15%" class="col"><%=user.getName() %></td>
  			<td width="40%" class="col"><%=pro.getPname() %></td>
  			<td width="20%" class="col"><%=order.getDeliverydate()%></td>
  			<td width="10%" class="col"><div class="view"><a href="/delivery_manager/orderdetail/view?id=<%=order.getOid()%>" style="text-decoration:none;">VIEW</a></div></td>
  		</tr>
  		<%
  		}
  		%>
  	</table>
</body>
</html>