<%@ page import="ecommerce.ApiClass" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.Iterator" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">

<head>

  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">

  <title>Homepage</title>

  <!-- Bootstrap core CSS -->
  <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

  <!-- Custom styles for this template -->
  <link href="css/shop-homepage.css" rel="stylesheet">
		<script src="http://code.jquery.com/jquery-latest.js">   
        </script>
        <script>
            $(document).ready(function() {                        
                $('.categoryTag').click(function(event) { 
                    var categoryName=this.id;
					var servletName='category';
                 	$.post('ActionServlet',{categoryName:categoryName, servletName:servletName},function(data,status) { 
					
						if (status==='success'){   
							window.location.href = 'products.jsp';
						}
						
                    });
					
				});
            });
        </script>
</head>

<body>

  <!-- Navigation -->
  <nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top">
    <div class="container">
      <a class="navbar-brand" href="#">Best Gadge</a>
      <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>
      <div class="collapse navbar-collapse" id="navbarResponsive">
        <ul class="navbar-nav ml-auto">
          <li class="nav-item active">
            <a class="nav-link" href="category.jsp">Home
              <span class="sr-only">(current)</span>
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="wishlist.jsp">Wishlist</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="cart.jsp">Cart</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="order.jsp">Orders</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="login.jsp">Logout</a>
          </li>
        </ul>
      </div>
    </div>
  </nav>

  <!-- Page Content -->
  <div class="container">

    <div class="row">

      

      <div class="col-lg-12">

        <div id="carouselExampleIndicators" class="carousel slide my-4" data-ride="carousel">
          <ol class="carousel-indicators">
            <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
            <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
            <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
          </ol>
          <div class="carousel-inner" role="listbox">
            <div class="carousel-item active">
              <img class="d-block img-fluid" src="resources/image/1.jpg" alt="First slide">
            </div>
            <div class="carousel-item">
              <img class="d-block img-fluid" src="resources/image/2.jpg" alt="Second slide">
            </div>
            <div class="carousel-item">
              <img class="d-block img-fluid" src="resources/image/3.jpg" alt="Third slide">
            </div>
          </div>
          <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
            <span class="sr-only">Previous</span>
          </a>
          <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
            <span class="carousel-control-next-icon" aria-hidden="true"></span>
            <span class="sr-only">Next</span>
          </a>
        </div>
		
        <div class="row">
        <div class="col-lg-4 col-md-6 mb-4 h-25">
            <div class="card">
              <div id="ShowAll" class="categoryTag"><img class="card-img-top" src="resources/image/ShowAll.jpg" alt="">
              <div class="card-body">
                <h4 class="card-title">
                  Show All
                </h4>
              </div>
              </div>
            </div>
          </div>
          
		  <%ApiClass ac = new ApiClass();
		  
		  	ArrayList<String> category = ac.getCategory();
		  	
		  	Iterator<String> i = category.iterator();
			while(i.hasNext()) {
				String cat = i.next();%>
				<div class="col-lg-4 col-md-6 mb-4 h-25">
            <div class="card">
              <div id="<%= cat%>" class="categoryTag"><img class="card-img-top" src="resources/image/<%=cat%>.jpg" alt="">
              <div class="card-body">
                <h4 class="card-title">
                  <%= cat %>
                </h4>
              </div>
              </div>
            </div>
            </div>
          <%
			}
		  	%>
			
			
        </div>
        <!-- /.row -->

      </div>
      <!-- /.col-lg-9 -->

    </div>
    <!-- /.row -->

  </div>
  <!-- /.container -->

  

  <!-- Bootstrap core JavaScript -->
  <script src="vendor/jquery/jquery.min.js"></script>
  <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

</body>

</html>
