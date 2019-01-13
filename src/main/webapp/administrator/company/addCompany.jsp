<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Delta Administration</title>
<%@page import="java.util.*,com.delta.admincontrollers.models.*" %>
<link rel="stylesheet" type="text/css" href="addCompany.css">
<script type="text/javascript">
function check()
{
	var cid=document.getElementById('cid').value;
	var cname=document.getElementById('cname').value;
	var cwebsite=document.getElementById('cwebsite').value;
	var country=document.getElementById('country').value;
	
	if(cid=='' || cname==''||cwebsite==''||country=='')
		alert("Fill up the form correctly");
	else
	{
		document.frm.method="post";
		document.frm.submit();
	}
}
function hel()
{
	alert('hel');
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
  	<form id="frm" name="frm" action="/administrator/company/add/verify">
		<div class="inputbox">
			<h1>Company Register Form</h1>
			<p>Enter Company Id ( Email ) : </p>
			<input type="email" name="cid" id="cid" placeholder="Enter Company Id" autofocus  autocomplete='off'>
			<br><br>
			<p>Enter Company Name : </p>
			<input type="text" name="cname" id="cname" placeholder="Enter Company Name" autocomplete='off'>
			<br><br>
			<p>Enter Company Website : </p>
			<input type="text" name="cwebsite" id="cwebsite" placeholder="Enter Company Website ">
			<br><br>
			<p>Enter Number of Product  : </p>
			<input type="number" name='noofpro' id="noofpro" value="0" placeholder="Enter Discount Price" readonly>
			<br><br>
			<p>Choose Country  : </p>
			<select name="country" id="country">
				<option value="">Choose country</option>
				<option>Afghanistan</option>
				<option>Albania</option>
				<option>Algeria</option>
				<option>Andorra</option>
				<option>Angola</option>
				<option>Antigua and Barbuda</option>
				<option>Argentina</option>
				<option>Armenia</option>
				<option>Australia</option>
				<option>Austria</option>
				<option>Azerbaijan</option>
				<option>Bahamas</option>
				<option>Bahrain</option>
				<option>Bangladesh</option>
				<option>Barbados</option>
				<option>Belarus</option>
				<option>Belgium</option>
				<option>Belize</option>
				<option>Benin</option>
				<option>Bhutan</option>
				<option>Bolivia</option>
				<option>Bosnia and Herzegovina</option>
				<option>Botswana</option>
				<option>Brazil</option>
				<option>Brunei</option>
				<option>Bulgaria</option>
				<option>Burkina Faso</option>
				<option>Burundi</option>
				<option>Cabo Verde</option>
				<option>Cambodia</option>
				<option>Cameroon</option>
				<option>Canada</option>
				<option>Central African Republic (CAR)</option>
				<option>Chad</option>
				<option>Chile</option>
				<option>China</option>
				<option>Colombia</option>
				<option>Comoros</option>
				<option>Democratic Republic of the Congo</option>
				<option>Republic of the Congo</option>
				<option>Costa Rica</option>
				<option>Cote d'Ivoire</option>
				<option>Croatia</option>
				<option>Cuba</option>
				<option>Cyprus</option>
				<option>Czech Republic</option>
				<option>Denmark</option>
				<option>Djibouti</option>
				<option>Dominica</option>
				<option>Dominican Republic</option>
				<option>Ecuador</option>
				<option>Egypt</option>
				<option>El Salvador</option>
				<option>Equatorial Guinea</option>
				<option>Eritrea</option>
				<option>Estonia</option>
				<option>Eswatini (formerly Swaziland)</option>
				<option>Ethiopia</option>
				<option>Fiji</option>
				<option>Finland</option>
				<option>France</option>
				<option>Gabon</option>
				<option>Gambia</option>
				<option>Georgia</option>
				<option>Germany</option>
				<option>Ghana</option>
				<option>Greece</option>
				<option>Grenada</option>
				<option>Guatemala</option>
				<option>Guinea</option>
				<option>Guinea-Bissau</option>
				<option>Guyana</option>
				<option>Haiti</option>
				<option>Honduras</option>
				<option>Hungary</option>
				<option>Iceland</option>
				<option>India</option>
				<option>Indonesia</option>
				<option>Iran</option>
				<option>Iraq</option>
				<option>Ireland</option>
				<option>Israel</option>
				<option>Italy</option>
				<option>Jamaica</option>
				<option>Japan</option>
				<option>Jordan</option>
				<option>Kazakhstan</option>
				<option>Kenya</option>
				<option>Kiribati</option>
				<option>Kosovo</option>
				<option>Kuwait</option>
				<option>Kyrgyzstan</option>
				<option>Laos</option>
				<option>Latvia</option>
				<option>Lebanon</option>
				<option>Lesotho</option>
				<option>Liberia</option>
				<option>Libya</option>
				<option>Liechtenstein</option>
				<option>Lithuania</option>
				<option>Luxembourg</option>
				<option>Macedonia (FYROM)</option>
				<option>Madagascar</option>
				<option>Malawi</option>
				<option>Malaysia</option>
				<option>Maldives</option>
				<option>Mali</option>
				<option>Malta</option>
				<option>Marshall Islands</option>
				<option>Mauritania</option>
				<option>Mauritius</option>
				<option>Mexico</option>
				<option>Micronesia</option>
				<option>Moldova</option>
				<option>Monaco</option>
				<option>Mongolia</option>
				<option>Montenegro</option>
				<option>Morocco</option>
				<option>Mozambique</option>
				<option>Myanmar (formerly Burma)</option>
				<option>Namibia</option>
				<option>Nauru</option>
				<option>Nepal</option>
				<option>Netherlands</option>
				<option>New Zealand</option>
				<option>Nicaragua</option>
				<option>Niger</option>
				<option>Nigeria</option>
				<option>North Korea</option>
				<option>Norway</option>
				<option>Oman</option>
				<option>Pakistan</option>
				<option>Palau</option>
				<option>Palestine</option>
				<option>Panama</option>
				<option>Papua New Guinea</option>
				<option>Paraguay</option>
				<option>Peru</option>
				<option>Philippines</option>
				<option>Poland</option>
				<option>Portugal</option>
				<option>Qatar</option>
				<option>Romania</option>
				<option>Russia</option>
				<option>Rwanda</option>
				<option>Saint Kitts and Nevis</option>
				<option>Saint Lucia</option>
				<option>Saint Vincent and the Grenadines</option>
				<option>Samoa</option>
				<option>San Marino</option>
				<option>Sao Tome and Principe</option>
				<option>Saudi Arabia</option>
				<option>Senegal</option>
				<option>Serbia</option>
				<option>Seychelles</option>
				<option>Sierra Leone</option>
				<option>Singapore</option>
				<option>Slovakia</option>
				<option>Slovenia</option>
				<option>Solomon Islands</option>
				<option>Somalia</option>
				<option>South Africa</option>
				<option>South Korea</option>
				<option>South Sudan</option>
				<option>Spain</option>
				<option>Sri Lanka</option>
				<option>Sudan</option>
				<option>Suriname</option>
				<option>Swaziland (renamed to Eswatini)</option>
				<option>Sweden</option>
				<option>Switzerland</option>
				<option>Syria</option>
				<option>Taiwan</option>
				<option>Tajikistan</option>
				<option>Tanzania</option>
				<option>Thailand</option>
				<option>Timor-Leste</option>
				<option>Togo</option>
				<option>Tonga</option>
				<option>Trinidad and Tobago</option>
				<option>Tunisia</option>
				<option>Turkey</option>
				<option>Turkmenistan</option>
				<option>Tuvalu</option>
				<option>Uganda</option>
				<option>Ukraine</option>
				<option>United Arab Emirates (UAE)</option>
				<option>United Kingdom (UK)</option>
				<option>United States of America (USA)</option>
				<option>Uruguay</option>
				<option>Uzbekistan</option>
				<option>Vanuatu</option>
				<option>Vatican City (Holy See)</option>
				<option>Venezuela</option>
				<option>Vietnam</option>
				<option>Yemen</option>
				<option>Zambia</option>
				<option>Zimbabwe</option>
			</select>
			<br><br>
			<input type='button' value='Add' onclick="check()">
		</div>
	</form>
</body>
</html>