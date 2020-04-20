<%@page import="ecommerce.Specification"%>
<%@ page import="ecommerce.ApiClass" %>
<%@ page import="ecommerce.DescriptionController" %>
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

  <title>Shop Homepage - Start Bootstrap Template</title>

  <!-- Bootstrap core CSS -->
  <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

  <!-- Custom styles for this template -->
  <link href="css/shop-descpage.css" rel="stylesheet">
		<script src="http://code.jquery.com/jquery-latest.js">   
        </script>
        <script>
            $(document).ready(function() {  
				$('.popup').hide(0);	          
				$('#cart').click(function(event) { 
						var servletName='productdesc';
						var listType='C';
	                 	$.post('ActionServlet',{listType:listType, servletName:servletName},function(data,status) { 
						
							if (status==='success'){   
								$('#popuptext').text(data);
								$('.popup').show();

								$('.popup').delay(3000).hide(0);
							}
							
	                    });
						
					});
				$('#wishlist').click(function(event) { 
					var servletName='productdesc';
				    var listType='W';
				                 	$.post('ActionServlet',{listType:listType, servletName:servletName},function(data,status) { 
									
										if (status==='success'){   
											$('#popuptext').text(data);
											$('.popup').show();

											$('.popup').delay(3000).hide(0);
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
    <div class="col-lg-12 col-md-6 mb-4 h-25">
	<div class="popup">
      	<span class="popuptext" id="popuptext"></span>
    </div>
    </div>
    </div>
    </div>
      <div class="col-lg-12">
		<%ApiClass ac = new ApiClass();
		  
			DescriptionController desc = ac.getProdDesc((String)request.getSession().getAttribute("product"));
		  	
		  	ProductsController p = desc.getP();
		  	%>
		  	<div class="row">
        
          <div class="col-lg-6 col-md-6 mb-4 h-25">
            <div class="card">
              <div id="<%=p.getProduct_id() %>" class="imageTag"><img class="card-img-top" src="resources/image/<%=p.getProduct_name()%>.jpg" alt="">
              </div>
            </div>
            <div class="desc">
             <button id="cart">Add to Cart</button>
             <p></p>
             <button id="wishlist">Add to Wishlist</button>
             
            </div>
          </div>
          <div class="col-lg-6 col-md-6 mb-4 h-25">
            <div>
              <h1><%= p.getBrand_name() %> <%= p.getProduct_name() %></h1>
              <h2>$<%= p.getPrice() %></h2>
              <h5><%= p.getDescription() %></h5>
              <table class="table table-striped">
				  <thead>
				    <tr>
				      <th scope="col">Specification</th>
				      <th scope="col">Value</th>
				    </tr>
				  </thead>
		  	<%
		  	Specification spec;
		  	ArrayList<Specification> s = desc.getS();
		  	Iterator<Specification> i = s.iterator();
			
			while(i.hasNext()) {
				spec = i.next();%>
				
				  <tbody>
				    <tr>
				      <th scope="row"><%= spec.getSpec() %></th>
				      <td><%= spec.getVal() %></td>
				    </tr>
				  </tbody>
				
		<%} %>
		</table>
            </div>
          </div>
        </div>	
        <!-- <div class="row">
        
          
		  <div class="col-lg-12 col-md-6 mb-4 h-25">
            <div>
              <h1>Feedback</h1>
            </div>
          </div>
        </div>-->
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
