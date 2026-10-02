<%@ page language="java"
         contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>

<%@ page import="com.curiocart.model.User" %>

<%
    User loggedInUser = (User) session.getAttribute("user");

    if (loggedInUser == null) {
        response.sendRedirect("login.jsp");
        return;
    }
%>

<!DOCTYPE html>
<html>

<head>

    <title>Curiocart - Home</title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
          rel="stylesheet">

    <link rel="stylesheet" href="MyStyle.css">

</head>

<body>

    <%@ include file="navbar.jsp" %>

    <div class="container">

        <div class="hero-section text-center">

            <h1>Welcome to Curiocart</h1>

            <p>
                Welcome, <%= loggedInUser.getName() %>!
            </p>

            <p>
                Discover amazing products at amazing prices.
            </p>

            <a href="products.jsp" class="btn btn-warning">
                Shop Now
            </a>

        </div>

    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>

</body>

</html>