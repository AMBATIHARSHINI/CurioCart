<%@ page import="com.curiocart.model.User" %>

<%
    User Orderuser = (User) session.getAttribute("user");

    if(Orderuser == null) {
        response.sendRedirect("login.jsp");
        return;
    }
%>

<!DOCTYPE html>
<html>

<head>

    <meta charset="UTF-8">

    <title>Order Success - Curiocart</title>

    <link
        href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
        rel="stylesheet">

    <link rel="stylesheet"
          href="css/MyStyle.css">

</head>

<body>

    <%@ include file="navbar.jsp" %>

    <div class="container mt-5">

        <div class="card shadow text-center p-5">

            <h1 class="text-success">
               Order Placed Successfully!
            </h1>
            <p class="mt-3">
                Thank you for shopping with Curiocart.
            </p>

            <p>
                Your order has been placed successfully.
            </p>

            <div class="mt-4">

                <a href="products.jsp"
                   class="btn btn-warning">
                    Continue Shopping
                </a>

                <a href="home.jsp"
                   class="btn btn-dark">
                    Go to Home
                </a>

            </div>

        </div>

    </div>

</body>

</html>