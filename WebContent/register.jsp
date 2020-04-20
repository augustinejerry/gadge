<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">

<head>

  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">

  <title>Register</title>

  <!-- Bootstrap core CSS -->
  <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

  <!-- Custom styles for this template -->
  <link href="css/shop-registerpage.css" rel="stylesheet">
	<script> 
function validate()                                    
{ 
    var email = document.forms["registerform"]["email"];               
    var password = document.forms["registerform"]["password"];    
    var fname = document.forms["registerform"]["fname"];  
    var lname =  document.forms["registerform"]["lname"];  
    var dob = document.forms["registerform"]["dob"];  
    var phone = document.forms["registerform"]["phone"];  
    var add1 = document.forms["registerform"]["add1"];  
    var add2 = document.forms["registerform"]["add2"];  
    var city = document.forms["registerform"]["city"];  
    var province = document.forms["registerform"]["province"];  
    var zip = document.forms["registerform"]["zip"];  
    
    if (email.value == "")                                   
    { 
    	document.getElementById("msg").innerHTML = "your message";
        window.alert("Please enter a valid e-mail address."); 
        email.focus(); 
        return false; 
    } 
    if (password.value == "0")                                   
    { 
        window.alert("Please enter a valid password."); 
        password.focus(); 
        return false; 
    } 
    if (fname.value == "")                                  
    { 
        window.alert("Please enter your first name."); 
        fname.focus(); 
        return false; 
    } 
   
    if (lname.value == "")                               
    { 
        window.alert("Please enter your last name."); 
        lname.focus(); 
        return false; 
    } 
       
    if (dob.value == "")                           
    { 
        window.alert("Please enter your Date of Birth."); 
        dob.focus(); 
        return false; 
    } 
   
    if (phone.value == "")                           
    { 
        window.alert("Please enter your telephone number."); 
        phone.focus(); 
        return false; 
    } 
   
    if (add1.value == "")                           
    { 
        window.alert("Please enter your address."); 
        add1.focus(); 
        return false; 
    } 
   
    if (city.value == "")                           
    { 
        window.alert("Please enter your city."); 
        city.focus(); 
        return false; 
    }
    if (province.value == "")                           
    { 
        window.alert("Please enter your province."); 
        province.focus(); 
        return false; 
    }
    if (zip.value == "")                           
    { 
        window.alert("Please enter your zip."); 
        zip.focus(); 
        return false; 
    } 
   
    return true; 
}</script> 
</head>

<body>

  <!-- Navigation -->
  <nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top">
    <div class="container">
      <a class="navbar-brand" href="#">Best Gadge</a>
      
      
    </div>
  </nav>

  <!-- Page Content -->
  <div class="container">

    <div class="row"> 

      <div class="col-lg-12">
      	
		
	        
		      	<div class="login-page">
					<div class="form">
						<form name="registerform" action="register" onsubmit="return validate()">
						  <div class="form-row">
						    <div class="form-group col-md-6">
						      <input type="email" id="inputEmail4" name="email" placeholder="Email" required>
						      <span id="msg"></span>
						    </div>
						    <div class="form-group col-md-6">
						      <input type="password" id="inputPassword4" name="password" placeholder="Password" required>
						    </div>
						  </div>
						  <div class="form-row">
						    <div class="form-group col-md-6">
						      <input type="text" id="inputFirstName" name="fname" placeholder="First Name" >
						    </div>
						    <div class="form-group col-md-6">
						      <input type="text" id="inputLastName" name="lname" placeholder="Last Name" required>
						    </div>
						  </div>
						  <div class="form-row">
						    <div class="form-group col-md-6">
						      <input type="text" id="inputDob" name="dob" placeholder="Date of Birth" required>
						    </div>
						    <div class="form-group col-md-6">
						      <input type="text" id="inputPhone" name="phone" placeholder="Phone Number" required>
						    </div>
						  </div>
						  <div class="form-group">
						    <input type="text" id="inputAddress1" name="add1" placeholder="Address Line 1" required>
						  </div>
						  <div class="form-group">
						    <input type="text" id="inputAddress2" name="add2" placeholder="Address Line 2">
						  </div>
						  <div class="form-row">
						    <div class="form-group col-md-6">
						      <input type="text" id="inputCity" name="city" placeholder="City" required>
						    </div>
						    <div class="form-group col-md-4">
						      <input type="text" id="inputState" name="province" placeholder="Province" required>
						    </div>
						    <div class="form-group col-md-2">
						      <input type="text" id="inputZip" name="zip" placeholder="Zip" required>
						    </div>
						  </div>
						  
						  <button type="submit">Sign in</button>
						</form>
					</div>
				</div>
	         	
		

      </div>
      <!-- /.col-lg-12 -->

    </div>
    <!-- /.row -->

  </div>
  <!-- /.container -->

  

  <!-- Bootstrap core JavaScript -->
  <script src="vendor/jquery/jquery.min.js"></script>
  <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

</body>

</html>
