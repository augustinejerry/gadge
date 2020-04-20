<%@ page import="ecommerce.ApiClass" %>
<%@ page import="ecommerce.ProductsController" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.Iterator" %>
<%@ page import="java.lang.String" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">

		<script src="http://code.jquery.com/jquery-latest.js">   
        </script>
        <script>

            $(document).ready(function() { 
	                
					 $('.remove').click(function(event) { 
		                    
							var productId=2	;
					var servletName='remove';
                 	$.post('ActionServlet',{productId:productId, servletName:servletName},function(data,status) { 
	location.reload();
			
                    });
						});
            });
        </script>

<body>

 
  
		        
		        <div class="content">
	 				<div class="row">
	 					<div class="col-md-12 col-lg-8">
	 						<div class="items">
	 							<%
	 							//response.setIntHeader("Refresh", 300);
	 							ApiClass ac = new ApiClass();
	 							float price = 0;
	 							float totalPrice = 0;
	 						  	ArrayList<ProductsController> products = ac.getList((Integer)request.getSession().getAttribute("userid"), "C");
	 						  	
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
					 						<img class="img-fluid mx-auto d-block image" src="resources/image/Capture.PNG">
					 					</div>
					 					<div class="col-md-8">
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
							 							<input id="quantity" type="number" value ="<%= p.getQty() %>" class="form-control quantity-input">
							 						</div>
							 						<div class="col-md-3 price">
							 							<span>$<%= String.format("%.2f", price) %></span>
							 						</div>
							 						<div class="col-md-2 ">
							 							<div class="remove">
							 								<button>X</button>
							 							</div>
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
			 					<div class="summary-item"><span class="text">Tax</span><span class="price">$<%= String.format("%.2f", tax) %></span></div>
			 					
			 					<div class="summary-item"><span class="text">Total</span><span class="price">$<%= String.format("%.2f", total) %></span></div>
			 					<button type="button" class="btn btn-primary btn-lg btn-block">Checkout</button>
				 			</div>
			 			</div>
		 			</div> 
		 		</div>
  <!-- /.container -->

  

  </body>

</html>
