<%@page import="ecommerce.OrderController"%>
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

  <title>Orders</title>

  <!-- Bootstrap core CSS -->
  <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

  <!-- Custom styles for this template -->
  <link href="css/shop-orderpage.css" rel="stylesheet">
		<script src="http://code.jquery.com/jquery-latest.js">   
        </script>
        <script>
            $(document).ready(function() {                        
                $('.orderTag').click(function(event) { 
                    var orderId=this.id;

var servletName='orderdetails';
                 	$.post('ActionServlet',{orderId:orderId, servletName:servletName},function(data,status) { 
	window.location.href = 'orderdetails.jsp';

                    });
					
				});
		$('.submitbtn').click(function(event) { 
	                    
	var id=this.id;
	var result = id.match(/submit_([0-9]*)_/);
	var orderId = result[1];
	alert(orderId);
	var feedback = $('#feedback_'+orderId+'_').val();
var servletName='feedback';
                 	$.post('ActionServlet',{orderId:orderId, feedback:feedback, servletName:servletName},function(data,status) { 
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
          <li class="nav-item active">
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
		  
		  	ArrayList<OrderController> orders = ac.getOrders(1);//(Integer)request.getSession().getAttribute("userid"));
		  	
		  	Iterator<OrderController> i = orders.iterator();
		  	OrderController c;
			while(i.hasNext()) {
				c = i.next();%>
          <div class="col-lg-12 col-md-6 mb-4 h-25">
            <div class="card">
              <div class="orderTag" id="<%= c.getOrderId() %>">
              
                <h4>
                  <b>Invoice No :</b> <%= c.getOrderId() %>
                </h4>
                <h5><b>Order Status :</b> <%= c.getStatus() %></h5>
                <h5><b>Order Date :</b> <%= c.getOrdeDate() %></h5>
                
              </div>
              <b>Feedback:</b>
              <div class="feedback">
              
              <input type="text" placeholder="feedback"  id="feedback_<%= c.getOrderId() %>_" value ="<%= c.getFeedback()%>"/>
				<button id="submit_<%= c.getOrderId() %>_" class="submitbtn">Submit</button>
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
