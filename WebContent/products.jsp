<%@ page import="ecommerce.ApiClass" %>
<%@ page import="ecommerce.ProductsController" %>
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

  <title>Productss</title>

  <!-- Bootstrap core CSS -->
  <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

  <!-- Custom styles for this template -->
  <link href="css/shop-homepage.css" rel="stylesheet">
		<script src="http://code.jquery.com/jquery-latest.js">   
        </script>
        <script>
            $(document).ready(function() {                        
                $('.productTag').click(function(event) { 
                    var productId=this.id;
					var servletName='products';
                 	$.post('ActionServlet',{productId:productId, servletName:servletName},function(data,status) { 
					
						if (status==='success'){   
							window.location.href = 'productdesc.jsp';
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
          <li class="nav-item">
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


        <div class="row">
        <%ApiClass ac = new ApiClass();
		  
		  	ArrayList<ProductsController> products = ac.getProducts((String)request.getSession().getAttribute("category"));
		  	
		  	request.getSession().setAttribute("category", "");
		  	
		  	Iterator<ProductsController> i = products.iterator();
		  	ProductsController p;
			while(i.hasNext()) {
				p = i.next();%>
          <div class="col-lg-4 col-md-6 mb-4 h-25">
            <div class="card">
              <div id="<%= p.getProduct_id()%>" class="productTag"><img class="card-img-top" src="resources/image/<%=p.getProduct_name()%>.jpg" alt="">
              <div class="card-body">
                <h4 class="card-title">
                  <%= p.getProduct_name()%>
                </h4>
                <h5>$<%= p.getPrice() %></h5>
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
