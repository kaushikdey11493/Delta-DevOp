<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Delta Web Store</title>
<style>
.welcome {
	color:white;
	background-color:#327FFF;
	font-weight:bold;
	text-align:center;
	font-size:24px;
	padding:25px;
	margin-bottom:25px;
}
* {box-sizing: border-box;}

body {font-family: Verdana, sans-serif;}

.mySlides {display: none;}

img {vertical-align: middle;}

/* Slideshow container */
.slideshow-container {
  max-width: 95%;
  position: relative;
  margin: auto;
 }

/* The dots/bullets/indicators */
.dot {
  height: 15px;
  width: 15px;
  margin: 0 2px;
  background-color: #bbb;
  border-radius: 50%;
  display: inline-block;
  transition: background-color 0.6s ease;
}

.active {
  background-color: #717171;
}

/* Fading animation */
.fade {
  -webkit-animation-name: fade;
  -webkit-animation-duration: 1.5s;
  animation-name: fade;
  animation-duration: 1.5s;
}

@-webkit-keyframes fade {
  from {opacity: .4} 
  to {opacity: 1}
}

@keyframes fade {
  from {opacity: .4} 
  to {opacity: 1}
}

/* On smaller screens, decrease text size */
@media only screen and (max-width: 300px) {
  .text {font-size: 11px}
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

div.gallery {
    margin: 1%;
    border: none;
    float: left;
    width: 18%;
    
}

div.gallery:hover {
    box-shadow: 10px 10px 5px #D9E9EA;
}

div.gallery img {
    width: 100%;
    height: 170px;
}


div.gallery1 {
    margin: 2%;
    border: none;
    float: left;
    width: 12%;
}

div.gallery1:hover {
    box-shadow: 10px 10px 5px #D9E9EA;
}

div.gallery1 img {
    width: 100%;
	height: 330px;
}


.feedback{
	background:black;
	width:100%;
	height:100px;
	margin-top:450px;
}
.feedback:hover{
	background:#E76200;
}
.feedback a{
	padding-left:40%;
	color:white;
	text-decoration:none;
	font-size:20px;
}

div.banner {
    margin: 4%;
    border: none;
    float: left;
    width: 40%;
    
}

div.banner:hover {
    box-shadow: 10px 10px 5px #D9E9EA;
}

div.banner img {
    width: 100%;
    height: 300px;
}

div.desc {
    padding: 15px;
    text-align: center;
    color:#076B8E;
    font-weight:bold;
}
a{
    text-decoration:none;
}

</style>
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
<div class="slideshow-container">

<div class="mySlides fade">
  <img src="image/electronics.jpg" style="width:100%;height:500px">
</div>

<div class="mySlides fade">
 <img src="image/phone.jpg" style="width:100%;height:500px">
</div>

<div class="mySlides fade">
  <img src="image/laptop.jpg" style="width:100%;height:500px">
</div>

<div class="mySlides fade">
  <img src="image/dress.jpg" style="width:100%;height:500px">
</div>
</div>
<br>
<div style="text-align:center">
  <span class="dot"></span> 
  <span class="dot"></span> 
  <span class="dot"></span> 
  <span class="dot"></span> 
</div>



<script>
var slideIndex = 0;
showSlides();

function showSlides() {
    var i;
    var slides = document.getElementsByClassName("mySlides");
    var dots = document.getElementsByClassName("dot");
    for (i = 0; i < slides.length; i++) {
       slides[i].style.display = "none";  
    }
    slideIndex++;
    if (slideIndex > slides.length) {slideIndex = 1}    
    for (i = 0; i < dots.length; i++) {
        dots[i].className = dots[i].className.replace(" active", "");
    }
    slides[slideIndex-1].style.display = "block";  
    dots[slideIndex-1].className += " active";
    setTimeout(showSlides, 3000); // Change image every 2 seconds
}
</script>
<div style="margin-top:70px">
	<div style="font-weight:bold;font-size:24px;margin-left:5%">Deals on Electronics</div><br>
	<div class="gallery">
		<a href="/electronics/electronics-home_theatre">
			<img src="image/IMG_999342_853854.jpg" alt="Electronics Appliances" >
			<div class="desc">Home Theatre</div>
		</a>
	</div>
	<div class="gallery">
		<a href="electronics/electronics-laptop">
			<img src="image/IMG_280651_362395.jpg" alt="Electronics Appliances" >
			<div class="desc">Laptop</div>
		</a>
	</div>
	<div class="gallery">
		<a href="/electronics/electronics-mobile">
			<img src="image/IMG_724014_648686.jpg" alt="Electronics Appliances" >
			<div class="desc">Phone</div>
		</a>
	</div>
	<div class="gallery">
		<a href="/electronics/electronics-television">
			<img src="image/IMG_324033_867325.jpg" alt="Electronics Appliances" >
			<div class="desc">Television</div>
		</a>
	</div>
	<div style="margin: 1%;border: none;float: left;width: 18%;">
		<a href="/electronics">
			<img src="image/viewmore.png" alt="Electronics Appliances" style="width:90%; height: 170px;">
		</a>
	</div>
</div>
<div class="banner">
  	<a href="/electronics">
    	<img src="image/electronicsb.jpg" alt="Electronics Appliances" >
  		<div class="desc">Electronics Appliances</div>
  	</a>
</div>
<div class="banner">
  	<a href="/home_&_furniture">
    	<img src="image/home&furniture.jpg" alt="Home & Furnitures" >
  		<div class="desc">Home & Furnitures</div>
  	</a>
</div>
<div style="font-weight:bold;font-size:24px;margin-left:5%;margin-top:650px"><br></div><br>
<div style="font-weight:bold;font-size:24px;margin-left:5%;">Deals on Furniture</div><br>
<div>
	<div class="gallery">
		<a href="/home_&_furniture/home_&_furniture-bed">
			<img src="image/IMG_225674_955846.jpg" alt="Electronics Appliances" >
			<div class="desc">Bed</div>
		</a>
	</div>
	<div class="gallery">
		<a href="/home_&_furniture/home_&_furniture-bed_sheets">
			<img src="image/IMG_270833_738171.jpg" alt="Electronics Appliances" >
			<div class="desc">Bed Sheets</div>
		</a>
	</div>
	<div class="gallery">
		<a href="/home_&_furniture/home_&_furniture-dinner_set">
			<img src="image/IMG_554477_609568.jpg" alt="Electronics Appliances" >
			<div class="desc">Dinner Set</div>
		</a>
	</div>
	<div class="gallery">
		<a href="/home_&_furniture/home_&_furniture-dinning_table">
			<img src="image/IMG_202866_833413.jpg" alt="Electronics Appliances" >
			<div class="desc">Dinning Table</div>
		</a>
	</div>
	<div style="margin: 1%;border: none;float: left;width: 18%;">
		<a href="/home_&_furniture">
			<img src="image/viewmore.png" alt="Electronics Appliances" style="width:90%; height: 170px;">
		</a>
	</div>
</div>	
<div style="font-weight:bold;font-size:24px;margin-left:5%;margin-top:290px">Deals on Women's Wear</div><br>
<div>
	<div class="gallery1">
		<a href="/women's_wear/women's_wear-jeans">
			<img src="image/IMG_44491_806375.jpg" alt="Electronics Appliances" >
			<div class="desc">Jeans</div>
		</a>
	</div>
	<div class="gallery1">
		<a href="/women's_wear/women's_wear-kurta">
			<img src="image/IMG_877611_106172.jpg" alt="Electronics Appliances" >
			<div class="desc">Kurta</div>
		</a>
	</div>
	<div class="gallery1">
		<a href="/women's_wear/women's_wear-salwar">
			<img src="image/IMG_292463_813711.jpg" alt="Electronics Appliances" >
			<div class="desc">Salwar</div>
		</a>
	</div>
	<div class="gallery1">
		<a href="/women's_wear/women's_wear-sarees">
			<img src="image/IMG_287406_80311.jpg" alt="Electronics Appliances" >
			<div class="desc">Saree</div>
		</a>
	</div>
	<div class="gallery1">
		<a href="/women's_wear/women's_wear-skirts">
			<img src="image/IMG_295787_653546.jpg" alt="Electronics Appliances" >
			<div class="desc">Skirt</div>
		</a>
	</div>
	<div style="margin: 1%;border: none;float: left;width: 18%;">
		<a href="/women's_wear">
			<img src="image/viewmore.png" alt="Electronics Appliances" style="width:90%; height: 170px;">
		</a>
	</div>
</div>
<div class="banner">
  	<a href="/women's_wear">
    	<img src="image/women.jpg" alt="Women's Wear" >
  		<div class="desc">Women's Wear</div>
  	</a>
</div>
<div class="banner">
  	<a href="/men's_wear">
    	<img src="image/men.jpg" alt="Men's Wear" >
  		<div class="desc">Men's Wear</div>
  	</a>
</div>
<div style="font-weight:bold;font-size:24px;margin-left:5%;margin-top:450px">Deals on Men's Wear</div><br>
<div>
	<div class="gallery1">
		<a href="/men's_wear/men's_wear-jacket">
			<img src="image/IMG_294305_474104.jpg" alt="Electronics Appliances" >
			<div class="desc">Jacket</div>
		</a>
	</div>
	<div class="gallery1">
		<a href="/men's_wear/men's_wear-jeans">
			<img src="image/IMG_156536_203802.jpg" alt="Electronics Appliances" >
			<div class="desc">Jeans</div>
		</a>
	</div>
	<div class="gallery1">
		<a href="/men's_wear/men's_wear-shirts">
			<img src="image/IMG_573237_349044.jpg" alt="Electronics Appliances" >
			<div class="desc">Shirts</div>
		</a>
	</div>
	<div class="gallery1">
		<a href="/men's_wear/men's_wear-trimmer">
			<img src="image/IMG_17089_630691.jpg" alt="Electronics Appliances" >
			<div class="desc">Trimmer</div>
		</a>
	</div>
	<div class="gallery1">
		<a href="/men's_wear/men's_wear-t_shirts">
			<img src="image/IMG_411191_96002.jpg" alt="Electronics Appliances" >
			<div class="desc">T Shirt</div>
		</a>
	</div>
	<div style="margin: 1%;border: none;float: left;width: 18%;">
		<a href="/men's_wear">
			<img src="image/viewmore.png" alt="Electronics Appliances" style="width:90%; height: 170px;">
		</a>
	</div>
</div>
<div class="feedback">
	<br><br>
	<a href="#" style="">Give Feedback</a>
</div>
<br><br>
<div style="width:100%;font-size:17px;font-weight:bold;color:green;text-align:center;padding:0 20%">
	Developed By Student Of Heritage Institute Of Technology : Kaushik Dey
	<br><br>
	Department : Information Technology (B.Tech) (2016 - 2020) 
	<br><br>
	Thank You For Visiting
</div>
</body>
</html>