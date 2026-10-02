<%@ page language="java"
         contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>

<%@ page import="java.util.List" %>
<%@ page import="com.curiocart.model.Product" %>
<%@ page import="com.curiocart.dao.ProductDAO" %>

<%
    // Get all products from database

    ProductDAO dao = new ProductDAO();

    List<Product> products = dao.getAllProducts();
%>


<!DOCTYPE html>

<html>

<head>

    <title>Curiocart - Products</title>

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

            Our Products

        </h2>



        <div class="row">


            <%
                for(Product product : products) {
            %>


                <div class="col-md-4 mb-4">


                    <div class="card h-100 shadow-sm">


                        <!-- ========================= -->
                        <!-- Product Image -->
                        <!-- ========================= -->

                        <%
                            if(product.getImage() != null &&
                               !product.getImage().isEmpty()) {
                        %>


                            <a href="productDetails.jsp?id=<%= product.getId() %>">

                                <img src="<%= product.getImage() %>"
                                     class="card-img-top"
                                     style="height:220px;
                                            object-fit:cover;">

                            </a>


                        <%
                            }
                            else {
                        %>


                            <div class="d-flex
                                        align-items-center
                                        justify-content-center
                                        bg-light"
                                 style="height:220px;">

                                <span class="text-muted">

                                    No Image

                                </span>

                            </div>


                        <%
                            }
                        %>



                        <div class="card-body">


                            <!-- ========================= -->
                            <!-- Product Name -->
                            <!-- ========================= -->

                            <h5 class="card-title">


                                <a href="productDetails.jsp?id=<%= product.getId() %>"
                                   class="text-dark">

                                    <%= product.getName() %>

                                </a>


                            </h5>



                            <!-- ========================= -->
                            <!-- Category -->
                            <!-- ========================= -->

                            <p class="text-muted">

                                <%= product.getCategory() %>

                            </p>



                            <!-- ========================= -->
                            <!-- Description -->
                            <!-- ========================= -->

                            <p class="card-text">

                                <%= product.getDescription() %>

                            </p>



                            <!-- ========================= -->
                            <!-- Price -->
                            <!-- ========================= -->

                            <h5>

                                ₹<%= product.getPrice() %>

                            </h5>



                            <!-- ========================= -->
                            <!-- Stock Status -->
                            <!-- ========================= -->

                            <%
                                if(product.getQuantity() == 0) {
                            %>


                                <p class="text-danger fw-bold">

                                    Out of Stock

                                </p>


                            <%
                                }
                                else if(product.getQuantity() <= 5) {
                            %>


                                <p class="text-warning fw-bold">

                                    Only <%= product.getQuantity() %>
                                    left in stock

                                </p>


                            <%
                                }
                                else {
                            %>


                                <p class="text-success fw-bold">

                                    In Stock

                                </p>


                            <%
                                }
                            %>



                            <!-- ========================= -->
                            <!-- Add To Cart -->
                            <!-- ========================= -->

                            <%
                                if(product.getQuantity() > 0) {
                            %>


                                <form action="AddToCartServlet"
                                      method="post">


                                    <!-- Product ID -->

                                    <input type="hidden"
                                           name="productId"
                                           value="<%= product.getId() %>">


                                    <!-- Add To Cart Button -->

                                    <button type="submit"
                                            class="btn btn-warning w-100">

                                        🛒 Add to Cart

                                    </button>


                                </form>


                            <%
                                }
                                else {
                            %>


                                <button class="btn btn-secondary w-100"
                                        disabled>

                                    Out of Stock

                                </button>


                            <%
                                }
                            %>


                        </div>

                    </div>

                </div>


            <%
                }
            %>


        </div>

    </div>



    <!-- Bootstrap JavaScript -->

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js">
    </script>


</body>

</html>