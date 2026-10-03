<%@ page language="java"
         contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>

<%@ page import="com.curiocart.model.Product" %>
<%@ page import="com.curiocart.dao.ProductDAO" %>

<%
    // Get product id from URL

    int id = Integer.parseInt(
            request.getParameter("id")
    );


    // Get product from database

    ProductDAO dao = new ProductDAO();

    Product product = dao.getProductById(id);


    // If product does not exist

    if(product == null) {

        response.sendRedirect("products.jsp");

        return;
    }
%>


<!DOCTYPE html>

<html>

<head>

    <title>Curiocart - <%= product.getName() %></title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
          rel="stylesheet">

    <link rel="stylesheet"
          href="MyStyle.css">

</head>


<body>


    <!-- Navbar -->

    <%@ include file="navbar.jsp" %>



    <div class="container mt-5">

        <div class="row">


            <!-- ========================= -->
            <!-- Product Image -->
            <!-- ========================= -->

            <div class="col-md-6">

                <div class="card shadow-sm">

                    <%
                        if(product.getImage() != null &&
                           !product.getImage().isEmpty()) {
                    %>

                        <img src="<%= product.getImage() %>"
                             class="img-fluid"
                             style="width:100%;
                                    height:450px;
                                    object-fit:cover;">

                    <%
                        }
                        else {
                    %>

                        <div class="d-flex
                                    align-items-center
                                    justify-content-center
                                    bg-light"
                             style="height:450px;">

                            <span class="text-muted">

                                No Image Available

                            </span>

                        </div>

                    <%
                        }
                    %>

                </div>

            </div>



            <!-- ========================= -->
            <!-- Product Details -->
            <!-- ========================= -->

            <div class="col-md-6">


                <!-- Product Name -->

                <h1 class="mb-3">

                    <%= product.getName() %>

                </h1>



                <!-- Category -->

                <p class="text-muted">

                    Category:

                    <%= product.getCategory() %>

                </p>



                <!-- Description -->

                <p class="mt-4">

                    <%= product.getDescription() %>

                </p>



                <!-- Price -->

                <h2 class="mt-4">

                    ₹<%= product.getPrice() %>

                </h2>



                <!-- Discount -->

                <%
                    if(product.getDiscount() > 0) {
                %>

                    <p class="text-success fw-bold">

                        <%= product.getDiscount() %>% OFF

                    </p>

                <%
                    }
                %>



                <!-- ========================= -->
                <!-- Stock -->
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

                        <!-- Send Product ID -->

                        <input type="hidden"
                               name="productId"
                               value="<%= product.getId() %>">


                        <!-- Add To Cart Button -->

                        <button type="submit"
                                class="btn btn-warning btn-lg mt-3">

                            🛒 Add to Cart

                        </button>

                    </form>

                <%
                    }
                    else {
                %>

                    <button class="btn btn-secondary btn-lg mt-3"
                            disabled>

                        Out of Stock

                    </button>

                <%
                    }
                %>



                <!-- ========================= -->
                <!-- Back Button -->
                <!-- ========================= -->

                <div class="mt-4">

                    <a href="products.jsp"
                       class="btn btn-dark">

                        ← Back to Products

                    </a>

                </div>


            </div>

        </div>

    </div>


    <!-- Bootstrap JS -->

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js">
    </script>


</body>

</html>