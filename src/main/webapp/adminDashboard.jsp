<%@ page language="java"
         contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>

<%@ page import="com.curiocart.model.User" %>

<%
    User adminuser = (User) session.getAttribute("user");

    if (adminuser == null ||
        !adminuser.getRole().equals("ADMIN")) {

        response.sendRedirect("login.jsp");
        return;
    }
%>

<!DOCTYPE html>

<html>

<head>

    <title>Curiocart - Admin Dashboard</title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
          rel="stylesheet">

    <link rel="stylesheet"
          href="MyStyle.css">

</head>

<body>

    <%@ include file="navbar.jsp" %>


    <div class="container mt-5">


        <!-- Dashboard Heading -->

        <div class="text-center mb-5">

            <h1>
                Admin Dashboard
            </h1>

            <p class="text-muted">

                Welcome, <%= adminuser.getName() %>!

            </p>

        </div>


        <div class="row justify-content-center">


            <!-- Add Product -->

            <div class="col-md-4 mb-4">

                <div class="card shadow-sm h-100">

                    <div class="card-body text-center">

                        <h4 class="card-title">

                            Add Product

                        </h4>

                        <p class="card-text">

                            Add new products to Curiocart.

                        </p>

                        <a href="addProduct.jsp"
                           class="btn btn-warning">

                            Add Product

                        </a>

                    </div>

                </div>

            </div>


            <!-- Manage Products -->

            <div class="col-md-4 mb-4">

                <div class="card shadow-sm h-100">

                    <div class="card-body text-center">

                        <h4 class="card-title">

                            Manage Products

                        </h4>

                        <p class="card-text">

                            View, update and delete products.

                        </p>

                        <a href="products.jsp"
                           class="btn btn-dark">

                            Manage Products

                        </a>

                    </div>

                </div>

            </div>


            <!-- Orders -->

            <div class="col-md-4 mb-4">

                <div class="card shadow-sm h-100">

                    <div class="card-body text-center">

                        <h4 class="card-title">

                            Orders

                        </h4>

                        <p class="card-text">

                            View customer orders.

                        </p>

                        <a href="AdminOrdersServlet"
                           class="btn btn-warning">

                            View Orders

                        </a>

                    </div>

                </div>

            </div>


        </div>

    </div>


    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js">
    </script>

</body>

</html>