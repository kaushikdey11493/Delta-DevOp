<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.*,com.delta.admincontrollers.models.*,com.delta.admincontrollers.dao.*,java.net.*" %>
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

</style>
<script type="text/javascript">
function change(img)
{
	document.getElementById("disp").src=img;
	document.getElementById(img).style.border="blue solid 2px";
}
function remove1(img)
{
	document.getElementById(img).style.border="#E7E7E7 solid 1px";
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
<div style="width:40%;float:left;position:sticky;top: 0;">
	
	<div style="padding:1% 5%;">
		<%
		ImageList imglist=(ImageList)request.getAttribute("imglist");
		List<Image> list=imglist.getList();
		Image im=list.get(0);
		for(Image img : list)
		{
		%>
			<img id="<%=img.getImgsrc() %>" src="<%=img.getImgsrc()%>" style="width:7%;height:5%;padding:2%;border:#E7E7E7 solid 1px" onmouseover="change('<%=img.getImgsrc() %>')" onmouseout="remove1('<%=img.getImgsrc() %>')">
		<%
		}
		%>
	</div>
	
	<div>
		<img id="disp" src="<%=im.getImgsrc() %>"  style="width:70%;margin:0 15%;border : #E7E7E7 solid 1px">
	</div>
	
	<br>
	<%
	Product pro=(Product)request.getAttribute("pro");
	%>
	
	<div>
		<a href="/addtocart?pid=<%=URLEncoder.encode(pro.getPid(), "UTF-8")%>"><button style="margin:5%;width:40%;border:none;padding:3% 7%;color:white;background:#FF9300;font-weight:bold;font-size:15px;float:left">ADD TO CART</button></a>
		<a href="/buynow?pid=<%=URLEncoder.encode(pro.getPid(), "UTF-8")%>"><button style="margin:5%;width:40%;border:none;padding:3% 7%;color:white;background:#FF6100;font-weight:bold;font-size:15px;">BUY NOW</button></a>
	</div>

</div>

<div style="width:60%;float:left;margin-top:2%"> 
	<div style="font-weight:bold;margin:4% 0 4% 4%;font-size:18px"><%=pro.getPname() %></div>
	
	<p style="font-weight:bold;margin-left:4%;font-size:18px;color:green">Special Price : </p>
	<%
	if(pro.getDprice()!=0)
	{
	%>
		<p style="font-weight:bold;margin-left:4%;font-size:24px">Rs <%=pro.getDprice() %> <strike style="font-size:18px;color:#9C9C9C">Rs <%=pro.getPrice() %></strike></p>
	<%
	}
	else
	{
	%>
		<p style="font-weight:bold;margin-left:4%;font-size:24px">Rs <%=pro.getPrice() %> </p>
	<%
	}
	%>
	<br>
	
	<div>
		<pre><div style="font-weight:bold;float:left;margin-left:4%;color:#9C9C9C;font-size:15px">Delivery : </div><div style="font-weight:bold;float:left;font-size:15px">Within 5 Days</div></pre>
	</div>
	
	<br>
	
	<div style="font-weight:bold;margin-left:4%;font-size:15px">
		<p style="font-size:28px">Details :</p>
		<table>
			<%
			String pdetails=pro.getPdetails();
			String detail[]=pdetails.split("<@>");
			for(String s : detail)
			{
				String d[]=s.split(":");
				if(d.length==2)
				{
			%>
			<tr>
				<td><pre style="font-weight:bold;color:#9C9C9C;font-size:15px"><%=d[0] %>	</pre></td><td style="font-weight:bold;"><%=d[1] %></td>
			</tr>
				<%
				}
				else
				{
				%>
				<tr>
				<td><pre style="font-weight:bold;color:#9C9C9C;font-size:15px"><%=s %></pre></td>
				</tr>
			<%
				}
			}
			%>
		</table>
	<div>

</div>
<pre>
		 
</pre>
</body>
</html>