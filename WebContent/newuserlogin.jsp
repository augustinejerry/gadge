<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">

<head>

  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">

  <title>Best Gadge</title>

  <!-- Bootstrap core CSS -->
  <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

  <!-- Custom styles for this template -->
  <link href="css/shop-loginpage.css" rel="stylesheet">
  
  <script src="https://code.jquery.com/jquery-1.10.2.js"
	type="text/javascript"></script>
  <script src="js/blinkingmessage.js" type="text/javascript"></script>
  
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
						<form class="login-form" action = "login" method = "post">
						<div class="error" id = "error">Account created successfully. Please login to access your account.</div>
							<input type="text" placeholder="username" name="username" value="${username}"/>
					     	<input type="password" placeholder="password" name="password" value="${password}"/>
					     	<button>login</button>
					     	<p class="message">Not registered? <a href="register.jsp">Create an account</a></p>
					 	</form>
					</div>
				</div>
	          
		

      </div>
      <!-- /.col-lg-12 -->

    </div>
    <!-- /.row -->

  </div>
  <!-- /.container -->

  <!-- Footer -->
  <footer class="py-5 bg-dark">
    <div class="container">
      <p class="m-0 text-center text-white">Copyright &copy; Best Gadge 2020</p>
    </div>
    <!-- /.container -->
  </footer>

  <!-- Bootstrap core JavaScript -->
  <script src="vendor/jquery/jquery.min.js"></script>
  <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

</body>

</html>
