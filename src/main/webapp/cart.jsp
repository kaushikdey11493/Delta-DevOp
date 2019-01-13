<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Delta Web Store</title>
<%@ page import="java.util.*,com.delta.admincontrollers.models.*,com.delta.admincontrollers.dao.*,java.net.*" %>
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

.proview{
	background:#C5ECDD;
	margin:auto;
	width:95%;
	
} 

.col{
	text-align:center;
	padding:5px;
	font-weight:bold;
	font-size:80%;
	padding:1%;
	
}

.view{
	background:#00C97D;
	text-align:center;
	color:white;
	border-radius:5px;
	padding:20px 0px;
	width:100%;
}  

div a{
	text-decoration:none;color:white;
}
  
.remove{ 
	background:#FE7A1F;
	text-align:center;
	color:white;
	border-radius:5px;
	width:100%;
	padding:20px 0px;
	
}

</style>
<script type="text/javascript">
function confirm1(id)
{
	var obj=document.getElementById(id);
	var x=confirm("Are you sure want to remove from cart ?");
	if(!x)
	{
		obj.href="/cart"; 
	}
}

</script>
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
<div style="text-align:center;font-weight:bold">Cart List / Wish List</div>
<br><br>
<table class="proview">
  		<tr style="padding:20px">
  			<td class='col'>Product Image</td>
  			<td width="35%" class="col">Product Name</td>
  			<td width="16%" class="col">Product Price</td>
  			<td width="15%" class="col"></td>
  			<td width="15%" class="col"></td>
  		</tr>
  		<tr></tr>
  		<tr></tr>
  		<tr></tr>
  		<%
  		ProductRepo prorepo=(ProductRepo)request.getAttribute("prorepo");
  		ImageRepo imgrepo=(ImageRepo)request.getAttribute("imgrepo");
  		CartList cartlist=(CartList)request.getAttribute("cartlist");
  		List<Cart> list=cartlist.getList();
  		for(Cart cart : list)
  		{
  			List<Image> imglist=imgrepo.findByPid(cart.getPid());
  			Product pro=prorepo.findById(cart.getPid()).orElse(null);
  			String price="";
  			if(pro.getDprice()==0)
  				price=""+pro.getPrice();
  			else
  				price=""+pro.getDprice();
  			
  		%>
  		<tr class="row" style="padding:20px">
  			<td class="col"><img src="<%=imglist.get(0).getImgsrc() %>" style="width:150px;height:150px;border-radius:75px" alt="No image"></td>
  			<td width="35%" class="col"><a href="/productview?id=<%=URLEncoder.encode(pro.getPid(), "UTF-8")%>" style="text-decoration:none"><%=pro.getPname() %></a></td>
  			<td width="16%" class="col">Rs <%=price %></td>
  			<td width="15%" class="col"><div class="view"><a href="/confirmcartorder?id=<%=cart.getId() %>" >BUY NOW</a></div></td>
  			<td width="15%" class="col"><div class="remove"><a id="<%=cart.getId() %>" href="/removefromcart?id=<%=cart.getId() %>" onclick="confirm1('<%=cart.getId() %>')">REMOVE FROM CART</a></div></td>
  		</tr>
  		<%
  		}
  		%>
 </table>
  	
<br><br>	
<br><br>
<div style="text-align:center;font-weight:bold">Recent Order List</div>
<br><br>
<table class="proview">
  		<tr style="padding:20px">
  			<td class='col'>Product Image</td>
  			<td width="35%" class="col">Product Name</td>
  			<td width="15%" class="col">Amount To Pay</td>
  			<td width="15%" class="col">Delivery Date</td>
  			<td width="15%" class="col"></td>
  		</tr>
  		<tr></tr>
  		<tr></tr>
  		<tr></tr>
  		<%
  		OrderList orderlist=(OrderList)request.getAttribute("orderlist");
  		List<OrderDetail> olist=orderlist.getList();
  		for(OrderDetail order : olist)
  		{
  			List<Image> imglist=imgrepo.findByPid(order.getPid());
  			Product pro=prorepo.findById(order.getPid()).orElse(null);
  			
  		%>
  		<tr class="row" style="padding:20px">
  			<td class="col"><img src="<%=imglist.get(0).getImgsrc() %>" style="width:150px;height:150px;border-radius:75px" alt="No image"></td>
  			<td width="35%" class="col"><a href="/productview?id=<%=pro.getPid()%>" style="text-decoration:none"><%=pro.getPname() %></a></td>
  			<td width="15%" class="col">Rs <%=order.getPrice() %></td>
  			<td width="15%" class="col"><%=order.getDeliverydate() %></td>
  			<td width="15%" class="col"><div class="remove"><a id="<%=order.getOid() %>" href="/cancelorder?oid=<%=order.getOid() %>" onclick="confirm1('<%=order.getOid() %>')">CANCEL ORDER</a></div></td>
  		</tr>
  		<%
  		}
  		%>
  	</table>
</body>
</html>