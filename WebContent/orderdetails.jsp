<%@page import="ecommerce.AddressController"%>
<%@ page import="ecommerce.ApiClass" %>
<%@ page import="ecommerce.ProductsController" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.Iterator" %>
<%@ page import="java.lang.String" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">

<head>

  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">

  <title>Order Details</title>

  <!-- Bootstrap core CSS -->
  <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

  <!-- Custom styles for this template -->
  	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"">
	<link href="https://fonts.googleapis.com/css?family=Montserrat" rel="stylesheet">
	<link rel="stylesheet" href="shopping-cart.css">
		<script src="http://code.jquery.com/jquery-latest.js">   
        </script>
        <script>

            $(document).ready(function() { 
	$('#placeorder').click(function(event) { 
		var servletName='placeorder';
	alert("hello")
		                 	$.post('ActionServlet',{servletName:servletName},function(data,status) { 
		location.reload();
		                    });
		});
	                 $('.remove').click(function(event) { 
		                    
		var id=this.id;
	var result = id.match(/remove_([0-9]*)_/);
	var productId = result[1];
	alert(productId);
var servletName='remove';
                 	$.post('ActionServlet',{productId:productId, servletName:servletName},function(data,status) { 
location.reload();

                    });
	});

					
 				$('.form-control quantity-input').focusout(function(event) { 
	                    
	var id=this.id;
	var result = id.match(/quantity_([0-9]*)_/);
	var productId = result[1];
	
	var qty = id.val();
	alert(productId);
	alert(qty);
var servletName='update';
                 	$.post('ActionServlet',{productId:productId, qty:qty, servletName:servletName},function(data,status) { 
location.reload();

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
  <main class="page">
	 	<section class="shopping-cart dark">
	 		<div id="container" class="container">
		        <div class="content">
	 				<div class="row">
	 					<div class="col-md-12 col-lg-8">
	 						<div class="items">
	 							<%
	 							//response.setIntHeader("Refresh", 300);
	 							ApiClass ac = new ApiClass();
	 							float price = 0;
	 							float totalPrice = 0;
	 						  	ArrayList<ProductsController> products = ac.getOrderDetails((Integer)request.getSession().getAttribute("userid"), (String)request.getSession().getAttribute("orderId"));
	 						  	AddressController address = ac.getAddress((Integer)request.getSession().getAttribute("userid"));
	 						  	
	 						  	Iterator<ProductsController> i = products.iterator();
	 						  	ProductsController p;
	 							while(i.hasNext()) {
	 								
	 								p = i.next();
	 								System.out.println("inn" + p.getProduct_name());
	 								price = p.getPrice() * p.getQty();
	 								totalPrice += price;
	 								%>
				 				<div class="product">
				 					<div class="row">
					 					<div class="col-md-3">
					 						<img class="img-fluid mx-auto d-block image" src="resources/image/<%=p.getProduct_name()%>.jpg">
					 					</div>
					 					<div class="col-md-9">
					 						<div class="info">
						 						<div class="row">
							 						<div class="col-md-4 product-name">
							 							<div class="product-name">
								 							<a href="#"><%= p.getProduct_name() %></a>
								 							<div class="product-info">
									 							<div>Brand: <span class="value"><%= p.getBrand_name() %></span></div>
									 							<div>Category: <span class="value"><%= p.getProduct_category() %></span></div>
									 							<div>Unit Price: <span class="value">$<%= String.format("%.2f", p.getPrice()) %></span></div>
									 						</div>
									 					</div>
							 						</div>
							 						<div class="col-md-3 quantity">
							 							<label for="quantity">Quantity:</label>
							 							<input id="quantity_<%=p.getProduct_id()%>_" type="number" value ="<%= p.getQty() %>" class="form-control quantity-input" disabled>
							 						</div>
							 						<div class="col-md-3 price">
							 							<span>$<%= String.format("%.2f", price) %></span>
							 						</div>
							 						
							 					</div>
							 				</div>
					 					</div>
					 				</div>
				 				</div>
				 				<%} 
				 				
				 				products.clear();%>
				 				
				 				
				 				
				 			</div>
			 			</div>
			 			<%float tax = totalPrice * 0.13f;
			 				float total = totalPrice + tax;%>
			 			<div class="col-md-12 col-lg-4">
			 				<div class="summary">
			 					<h3>Summary</h3>
			 					<div class="summary-item"><span class="text">Subtotal</span><span class="price">$<%= String.format("%.2f", totalPrice) %></span></div>
			 					<div class="summary-item"><span class="text">Tax(13%)</span><span class="price">$<%= String.format("%.2f", tax) %></span></div>
			 					
			 					<div class="summary-item"><span class="text">Total</span><span class="price">$<%= String.format("%.2f", total) %></span></div>
			 					<h3>Shipping Address</h3>
			 					<div class="summary-item"><span class="text"><%=address.getAddLine1()%><br><%=address.getAddLine2()%>
			 					<br><%=address.getCity()%><br><%=address.getProvince()%><br><%=address.getZip()%></span></div>
			 					</div>
			 			</div>
		 			</div> 
		 		</div>
		        
	 		</div>
		</section>
	</main>>
  <!-- /.container -->

  

  <!-- Bootstrap core JavaScript -->
  <script src="vendor/jquery/jquery.min.js"></script>
  <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

</body>

</html>
