<%@ page language="java"
         contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>

<%@ page import="java.util.List" %>
<%@ page import="com.curiocart.model.User" %>
<%@ page import="com.curiocart.model.Product" %>
<%@ page import="com.curiocart.dao.CartDAO" %>

<%
    // Get logged-in user

    User loggedInUser =
            (User) session.getAttribute("user");


    // Check login

    if(loggedInUser == null) {

        response.sendRedirect("login.jsp");

        return;
    }


    // Get cart items

    CartDAO dao = new CartDAO();

    List<Product> cartItems =
            dao.getCartItems(loggedInUser.getId());


    // Calculate total

    double total = 0;

    for(Product product : cartItems) {

        total = total +
                (product.getPrice() * product.getQuantity());
    }
%>


<!DOCTYPE html>

<html>

<head>

    <title>Curiocart - Cart</title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
          rel="stylesheet">

    <link rel="stylesheet"
          href="MyStyle.css">

</head>


<body>


    <!-- Navbar -->

    <%@ include file="navbar.jsp" %>



    <div class="container mt-5">


        <!-- Page Heading -->

        <h2 class="text-center mb-5">

            My Cart

        </h2>



        <%
            if(cartItems.isEmpty()) {
        %>


            <!-- ========================= -->
            <!-- Empty Cart -->
            <!-- ========================= -->

            <div class="text-center">

                <h4>

                    Your cart is empty

                </h4>

                <p class="text-muted">

                    Add some products to your cart.

                </p>

                <a href="products.jsp"
                   class="btn btn-warning">

                    Continue Shopping

                </a>

            </div>


        <%
            }
            else {
        %>


            <div class="row">


                <!-- ========================= -->
                <!-- Cart Products -->
                <!-- ========================= -->

                <div class="col-md-8">


                    <%
                        for(Product product : cartItems) {
                    %>


                        <div class="card mb-3 shadow-sm">


                            <div class="row g-0">


                                <!-- Product Image -->

                                <div class="col-md-3">

                                    <%
                                        if(product.getImage() != null &&
                                           !product.getImage().isEmpty()) {
                                    %>

                                        <img src="<%= product.getImage() %>"
                                             class="img-fluid rounded-start"
                                             style="height:180px;
                                                    width:100%;
                                                    object-fit:cover;">

                                    <%
                                        }
                                        else {
                                    %>

                                        <div class="d-flex
                                                    align-items-center
                                                    justify-content-center
                                                    bg-light"
                                             style="height:180px;">

                                            <span class="text-muted">

                                                No Image

                                            </span>

                                        </div>

                                    <%
                                        }
                                    %>

                                </div>



                                <!-- Product Details -->

                                <div class="col-md-9">


                                    <div class="card-body">


                                        <!-- Product Name -->

                                        <h5 class="card-title">

                                            <%= product.getName() %>

                                        </h5>



                                        <!-- Category -->

                                        <p class="text-muted">

                                            <%= product.getCategory() %>

                                        </p>



                                        <!-- Price -->

                                        <p>

                                            Price:

                                            <strong>

                                                ₹<%= product.getPrice() %>

                                            </strong>

                                        </p>



                                        <!-- ========================= -->
                                        <!-- Quantity Controls -->
                                        <!-- ========================= -->

                                        <div class="d-flex align-items-center mb-3">


                                            <span class="me-3">

                                                Quantity:

                                            </span>



                                            <!-- Minus Button -->

                                            <form action="UpdateCartServlet"
                                                  method="post"
                                                  class="me-2">

                                                <input type="hidden"
                                                       name="productId"
                                                       value="<%= product.getId() %>">

                                                <input type="hidden"
                                                       name="action"
                                                       value="decrease">

                                                <button type="submit"
                                                        class="btn btn-outline-dark">

                                                    −

                                                </button>

                                            </form>



                                            <!-- Quantity -->

                                            <span class="fw-bold mx-2">

                                                <%= product.getQuantity() %>

                                            </span>
                                           <!-- Plus Button -->

											<form action="UpdateCartServlet"
											      method="post"
											      class="ms-2">
											
											    <input type="hidden"
											           name="productId"
											           value="<%= product.getId() %>">
											
											    <input type="hidden"
											           name="action"
											           value="increase">
											
											    <%
											        if(product.getQuantity() >= product.getStockQuantity()) {
											    %>
											
											        <button type="submit"
											                class="btn btn-outline-secondary"
											                disabled>
											
											            +
											
											        </button>
											
											    <%
											        }
											        else {
											    %>
											
											        <button type="submit"
											                class="btn btn-outline-dark">
											
											            +
											
											        </button>
											
											    <%
											        }
											    %>
											
											</form>

                                        </div>



                                        <!-- Subtotal -->

                                        <p>

                                            Subtotal:

                                            <strong>

                                                ₹<%= product.getPrice()
                                                       * product.getQuantity() %>

                                            </strong>

                                        </p>



                                        <!-- ========================= -->
                                        <!-- Remove -->
                                        <!-- ========================= -->

                                        <form action="UpdateCartServlet"
                                              method="post">

                                            <input type="hidden"
                                                   name="productId"
                                                   value="<%= product.getId() %>">

                                            <input type="hidden"
                                                   name="action"
                                                   value="remove">

                                            <button type="submit"
                                                    class="btn btn-danger btn-sm">

                                                Remove

                                            </button>

                                        </form>


                                    </div>

                                </div>


                            </div>

                        </div>


                    <%
                        }
                    %>


                </div>



                <!-- ========================= -->
                <!-- Cart Summary -->
                <!-- ========================= -->

                <div class="col-md-4">


                    <div class="card shadow-sm">


                        <div class="card-body">


                            <h4 class="mb-4">

                                Cart Summary

                            </h4>



                            <div class="d-flex justify-content-between">

                                <span>

                                    Total

                                </span>

                                <strong>

                                    ₹<%= total %>

                                </strong>

                            </div>



                            <hr>
							  <a href="CheckoutServlet"
							   class="btn btn-warning w-100">
							
							    Proceed to Checkout
							
							  </a>

                        </div>

                    </div>


                </div>


            </div>


        <%
            }
        %>


    </div>



    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js">
    </script>


</body>

</html>