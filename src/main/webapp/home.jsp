<%@ page language="java"
         contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>

<%@ page import="java.util.List" %>
<%@ page import="com.curiocart.model.Product" %>
<%@ page import="com.curiocart.dao.ProductDAO" %>

<%
    ProductDAO productDAO = new ProductDAO();

    List<Product> products =
            productDAO.getAllProducts();
%>

<!DOCTYPE html>
<html>

<head>

    <meta charset="UTF-8">

    <title>Curiocart - Online Shopping</title>

    <!-- Bootstrap -->
    <link
        href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
        rel="stylesheet">

    <!-- Curiocart CSS -->
    <link rel="stylesheet"
          href="MyStyle.css">

    <style>

        /* ========================= */
        /* HERO SECTION */
        /* ========================= */

        .hero-banner {

            background:
                linear-gradient(
                    135deg,
                    #212529,
                    #343a40,
                    #495057
                );

            min-height: 450px;

            position: relative;

            overflow: hidden;

            box-shadow:
                0 10px 30px
                rgba(0,0,0,0.20);
        }


        .hero-banner::before {

            content: "";

            position: absolute;

            width: 350px;
            height: 350px;

            border-radius: 50%;

            background:
                rgba(255,193,7,0.15);

            top: -120px;
            right: -80px;
        }


        .hero-banner::after {

            content: "";

            position: absolute;

            width: 250px;
            height: 250px;

            border-radius: 50%;

            background:
                rgba(255,255,255,0.07);

            bottom: -120px;
            left: 40%;
        }


        .hero-content {

            position: relative;

            z-index: 2;
        }


        .hero-shopping-icon {

            font-size: 150px;

            position: relative;

            z-index: 2;

            animation:
                shoppingFloat
                3s ease-in-out infinite;
        }


        @keyframes shoppingFloat {

            0% {

                transform:
                    translateY(0);
            }

            50% {

                transform:
                    translateY(-15px);
            }

            100% {

                transform:
                    translateY(0);
            }
        }


        .hero-deal-card {

            display: inline-flex;

            align-items: center;

            gap: 10px;

            background: white;

            color: #212529;

            padding: 12px 20px;

            border-radius: 30px;

            box-shadow:
                0 8px 20px
                rgba(0,0,0,0.25);

            position: relative;

            z-index: 3;
        }


        /* ========================= */
        /* SEARCH SECTION */
        /* ========================= */

        .search-section {

            margin-top: -35px;

            position: relative;

            z-index: 5;
        }


        .search-box {

            background: white;

            padding: 15px;

            border-radius: 15px;

            box-shadow:
                0 8px 25px
                rgba(0,0,0,0.15);
        }


        /* ========================= */
        /* CATEGORY CARDS */
        /* ========================= */

        .category-card {

            border: none;

            border-radius: 18px;

            transition:
                transform 0.3s,
                box-shadow 0.3s;

            cursor: pointer;
        }


        .category-card:hover {

            transform:
                translateY(-8px);

            box-shadow:
                0 12px 25px
                rgba(0,0,0,0.15);
        }


        .category-icon {

            font-size: 55px;

            margin-bottom: 10px;
        }


        /* ========================= */
        /* PRODUCT CARDS */
        /* ========================= */

        .product-card {

            border: none;

            border-radius: 15px;

            overflow: hidden;

            transition:
                transform 0.3s,
                box-shadow 0.3s;
        }


        .product-card:hover {

            transform:
                translateY(-7px);

            box-shadow:
                0 12px 25px
                rgba(0,0,0,0.15);
        }


        .product-image {

            height: 220px;

            width: 100%;

            object-fit: contain;

            padding: 15px;

            background: #ffffff;
        }


        .deal-badge {

            position: absolute;

            top: 12px;

            left: 12px;

            background: #dc3545;

            color: white;

            padding: 5px 10px;

            border-radius: 20px;

            font-size: 13px;

            font-weight: bold;
        }


        /* ========================= */
        /* WHY CURIOCART */
        /* ========================= */

        .benefit-card {

            border: none;

            border-radius: 15px;

            background: white;

            padding: 30px 20px;

            height: 100%;

            box-shadow:
                0 5px 18px
                rgba(0,0,0,0.08);
        }


        .benefit-icon {

            font-size: 45px;

            margin-bottom: 15px;
        }


        /* ========================= */
        /* REVIEWS */
        /* ========================= */

        .review-card {

            background: white;

            border-radius: 15px;

            padding: 25px;

            height: 100%;

            box-shadow:
                0 5px 18px
                rgba(0,0,0,0.08);
        }


        .stars {

            color: #ffc107;

            font-size: 20px;
        }


        /* ========================= */
        /* FOOTER */
        /* ========================= */

        .footer-link {

            color: #adb5bd;

            text-decoration: none;
        }


        .footer-link:hover {

            color: #ffc107;
        }

    </style>

</head>


<body>


<!-- ========================= -->
<!-- NAVBAR -->
<!-- ========================= -->

<%@ include file="navbar.jsp" %>


<!-- ========================= -->
<!-- HERO SECTION -->
<!-- ========================= -->

<section class="container mt-4">

    <div class="hero-banner rounded-4">

        <div class="row
                    align-items-center
                    h-100
                    hero-content">


            <!-- LEFT SIDE -->

            <div class="col-md-7 p-5">

                <span class="badge
                             bg-warning
                             text-dark
                             px-3
                             py-2
                             mb-3">

                    🛍️ Curiocart Shopping

                </span>


                <h1 class="display-4
                           fw-bold
                           text-white">

                    Shop Smarter.

                    <br>

                    Live Better.

                </h1>


                <p class="lead
                          text-white
                          mt-3">

                    Discover amazing products,
                    exciting deals and everything
                    you need in one place.

                </p>


                <div class="mt-4">

                    <a href="products.jsp"
                       class="btn
                              btn-warning
                              btn-lg
                              me-2">

                        🛒 Shop Now

                    </a>


                    <a href="#featured"
                       class="btn
                              btn-outline-light
                              btn-lg">

                        Explore Products

                    </a>

                </div>

            </div>


            <!-- RIGHT SIDE -->

            <div class="col-md-5
                        text-center">

                <div class="hero-shopping-icon">

                    🛍️

                </div>


                <div class="hero-deal-card">

                    <span>

                        🔥

                    </span>

                    <strong>

                        Amazing Deals

                    </strong>

                </div>

            </div>

        </div>

    </div>

</section>


<!-- ========================= -->
<!-- SEARCH -->
<!-- ========================= -->

<section class="container search-section">

    <div class="search-box">

        <form action="SearchServlet"
              method="get">

            <div class="input-group
                        input-group-lg">

                <input type="text"
                       name="search"
                       class="form-control"
                       placeholder="Search for products, categories...">


                <button type="submit"
                        class="btn btn-warning">

                    🔍 Search

                </button>

            </div>

        </form>

    </div>

</section>


<!-- ========================= -->
<!-- CATEGORIES -->
<!-- ========================= -->

<section class="container mt-5">

    <div class="text-center mb-4">

        <h2 class="fw-bold">

            Shop by Category

        </h2>

        <p class="text-muted">

            Explore products from different categories

        </p>

    </div>


    <div class="row g-4">


        <!-- MOBILES -->

        <div class="col-6 col-md-3">

            <a href="CategoryServlet?category=Mobiles"
               class="text-decoration-none">

                <div class="card
                            category-card
                            text-center
                            h-100">

                    <div class="card-body p-4">

                        <div class="category-icon">

                            📱

                        </div>


                        <h5 class="fw-bold
                                   text-dark">

                            Mobiles

                        </h5>


                        <p class="text-muted mb-0">

                            Smartphones & accessories

                        </p>

                    </div>

                </div>

            </a>

        </div>


        <!-- ELECTRONICS -->

        <div class="col-6 col-md-3">

            <a href="CategoryServlet?category=Electronics"
               class="text-decoration-none">

                <div class="card
                            category-card
                            text-center
                            h-100">

                    <div class="card-body p-4">

                        <div class="category-icon">

                            💻

                        </div>


                        <h5 class="fw-bold
                                   text-dark">

                            Electronics

                        </h5>


                        <p class="text-muted mb-0">

                            Gadgets & devices

                        </p>

                    </div>

                </div>

            </a>

        </div>


        <!-- FASHION -->

        <div class="col-6 col-md-3">

            <a href="CategoryServlet?category=Fashion"
               class="text-decoration-none">

                <div class="card
                            category-card
                            text-center
                            h-100">

                    <div class="card-body p-4">

                        <div class="category-icon">

                            👕

                        </div>


                        <h5 class="fw-bold
                                   text-dark">

                            Fashion

                        </h5>


                        <p class="text-muted mb-0">

                            Latest fashion trends

                        </p>

                    </div>

                </div>

            </a>

        </div>


        <!-- HOME -->

        <div class="col-6 col-md-3">

            <a href="CategoryServlet?category=Home"
               class="text-decoration-none">

                <div class="card
                            category-card
                            text-center
                            h-100">

                    <div class="card-body p-4">

                        <div class="category-icon">

                            🏠

                        </div>


                        <h5 class="fw-bold
                                   text-dark">

                            Home

                        </h5>


                        <p class="text-muted mb-0">

                            Home essentials

                        </p>

                    </div>

                </div>

            </a>

        </div>

    </div>

</section>


<!-- ========================= -->
<!-- TODAY'S DEALS -->
<!-- ========================= -->

<section class="container mt-5">

    <div class="d-flex
                justify-content-between
                align-items-center
                mb-4">

        <div>

            <h2 class="fw-bold mb-1">

                🔥 Today's Deals

            </h2>


            <p class="text-muted mb-0">

                Grab the latest products before they're gone!

            </p>

        </div>


        <a href="products.jsp"
           class="btn btn-dark">

            View All

        </a>

    </div>


    <div class="row g-4">


        <%

            int dealCount = 0;

            for(Product product : products) {

                if(dealCount >= 4) {

                    break;

                }

                dealCount++;

        %>


        <div class="col-md-6 col-lg-3">

            <div class="card
                        product-card
                        h-100
                        position-relative">


                <!-- Deal Badge -->

                <div class="deal-badge">

                    🔥 DEAL

                </div>


                <!-- Product Image -->

                <%
                    if(product.getImage() != null &&
                       !product.getImage().isEmpty()) {
                %>

                    <img src="<%= product.getImage() %>"
                         class="product-image">

                <%
                    } else {
                %>

                    <div class="product-image
                                d-flex
                                align-items-center
                                justify-content-center"
                         style="font-size:70px;">

                        🛍️

                    </div>

                <%
                    }
                %>


                <!-- Product Details -->

                <div class="card-body">

                    <h5 class="card-title">

                        <%= product.getName() %>

                    </h5>


                    <p class="text-muted mb-2">

                        <%= product.getCategory() %>

                    </p>


                    <h5 class="fw-bold">

                        &#8377;<%= product.getPrice() %>

                    </h5>


                    <%
                        if(product.getDiscount() > 0) {
                    %>

                        <span class="badge bg-success">

                            <%= product.getDiscount() %>% OFF

                        </span>

                    <%
                        }
                    %>


                    <a href="productDetails.jsp?id=<%= product.getId() %>"
                       class="btn
                              btn-warning
                              w-100
                              mt-3">

                        View Product

                    </a>

                </div>

            </div>

        </div>


        <%

            }

        %>

    </div>

</section>


<!-- ========================= -->
<!-- FEATURED PRODUCTS -->
<!-- ========================= -->

<section class="container mt-5 mb-5"
         id="featured">


    <div class="d-flex
                justify-content-between
                align-items-center
                mb-4">


        <div>

            <h2 class="fw-bold mb-1">

                ⭐ Featured Products

            </h2>


            <p class="text-muted mb-0">

                Popular products picked for you

            </p>

        </div>


        <a href="products.jsp"
           class="btn btn-dark">

            View All

        </a>

    </div>


    <div class="row g-4">


        <%

            int featuredCount = 0;

            for(Product product : products) {

                if(featuredCount >= 4) {

                    break;

                }

                featuredCount++;

        %>


        <div class="col-md-6 col-lg-3">

            <div class="card
                        product-card
                        h-100">


                <!-- Image -->

                <%
                    if(product.getImage() != null &&
                       !product.getImage().isEmpty()) {
                %>

                    <img src="<%= product.getImage() %>"
                         class="product-image">

                <%
                    } else {
                %>

                    <div class="product-image
                                d-flex
                                align-items-center
                                justify-content-center"
                         style="font-size:70px;">

                        🛍️

                    </div>

                <%
                    }
                %>


                <div class="card-body">


                    <h5 class="card-title">

                        <%= product.getName() %>

                    </h5>


                    <p class="text-muted">

                        <%= product.getCategory() %>

                    </p>


                    <h5 class="fw-bold">

                        &#8377;<%= product.getPrice() %>

                    </h5>


                    <%
                        if(product.getQuantity() > 0) {
                    %>

                        <span class="text-success fw-bold">

                            ✓ In Stock

                        </span>

                    <%
                        } else {
                    %>

                        <span class="text-danger fw-bold">

                            Out of Stock

                        </span>

                    <%
                        }
                    %>


                    <a href="productDetails.jsp?id=<%= product.getId() %>"
                       class="btn
                              btn-warning
                              w-100
                              mt-3">

                        View Product

                    </a>

                </div>

            </div>

        </div>


        <%

            }

        %>

    </div>

</section>


<!-- ========================= -->
<!-- WHY CHOOSE CURIOCART -->
<!-- ========================= -->

<section class="container mt-5 mb-5">


    <div class="text-center mb-4">

        <h2 class="fw-bold">

            Why Shop With Curiocart?

        </h2>


        <p class="text-muted">

            We make online shopping simple and convenient.

        </p>

    </div>


    <div class="row g-4">


        <div class="col-md-3">

            <div class="benefit-card text-center">

                <div class="benefit-icon">

                    🚚

                </div>


                <h5 class="fw-bold">

                    Fast Delivery

                </h5>


                <p class="text-muted mb-0">

                    Get your products delivered quickly.

                </p>

            </div>

        </div>


        <div class="col-md-3">

            <div class="benefit-card text-center">

                <div class="benefit-icon">

                    🔒

                </div>


                <h5 class="fw-bold">

                    Secure Shopping

                </h5>


                <p class="text-muted mb-0">

                    Your shopping experience is protected.

                </p>

            </div>

        </div>


        <div class="col-md-3">

            <div class="benefit-card text-center">

                <div class="benefit-icon">

                    💳

                </div>


                <h5 class="fw-bold">

                    Easy Payment

                </h5>


                <p class="text-muted mb-0">

                    Simple and convenient checkout.

                </p>

            </div>

        </div>


        <div class="col-md-3">

            <div class="benefit-card text-center">

                <div class="benefit-icon">

                    📞

                </div>


                <h5 class="fw-bold">

                    Customer Support

                </h5>


                <p class="text-muted mb-0">

                    We're here when you need us.

                </p>

            </div>

        </div>

    </div>

</section>


<!-- ========================= -->
<!-- CUSTOMER REVIEWS -->
<!-- ========================= -->

<section class="container mt-5 mb-5">


    <div class="text-center mb-4">

        <h2 class="fw-bold">

            What Our Customers Say

        </h2>


        <p class="text-muted">

            Customer experiences with Curiocart

        </p>

    </div>


    <div class="row g-4">


        <div class="col-md-4">

            <div class="review-card">

                <div class="stars">

                    ⭐⭐⭐⭐⭐

                </div>


                <p class="mt-3">

                    "The shopping experience was simple
                    and the products were easy to find."

                </p>


                <strong>

                    Rahul

                </strong>

                <br>


                <small class="text-muted">

                    Verified Customer

                </small>

            </div>

        </div>


        <div class="col-md-4">

            <div class="review-card">

                <div class="stars">

                    ⭐⭐⭐⭐⭐

                </div>


                <p class="mt-3">

                    "I liked the clean product layout
                    and easy checkout process."

                </p>


                <strong>

                    Priya

                </strong>

                <br>


                <small class="text-muted">

                    Verified Customer

                </small>

            </div>

        </div>


        <div class="col-md-4">

            <div class="review-card">

                <div class="stars">

                    ⭐⭐⭐⭐⭐

                </div>


                <p class="mt-3">

                    "Finding products and checking my
                    orders was very convenient."

                </p>


                <strong>

                    Arjun

                </strong>

                <br>


                <small class="text-muted">

                    Verified Customer

                </small>

            </div>

        </div>

    </div>

</section>


<!-- ========================= -->
<!-- FOOTER -->
<!-- ========================= -->

<footer class="bg-dark
               text-white
               pt-5
               pb-4">


    <div class="container">


        <div class="row">


            <!-- Brand -->

            <div class="col-md-4 mb-4">

                <h4 class="fw-bold">

                    🛍️ Curiocart

                </h4>


                <p class="text-secondary">

                    Your simple and convenient
                    online shopping destination.

                </p>

            </div>


            <!-- Quick Links -->

            <div class="col-md-2 mb-4">

                <h6 class="fw-bold">

                    Quick Links

                </h6>


                <p class="mb-2">

                    <a href="home.jsp"
                       class="footer-link">

                        Home

                    </a>

                </p>


                <p class="mb-2">

                    <a href="products.jsp"
                       class="footer-link">

                        Products

                    </a>

                </p>


                <p class="mb-2">

                    <a href="cart.jsp"
                       class="footer-link">

                        Cart

                    </a>

                </p>

            </div>


            <!-- Orders -->

            <div class="col-md-3 mb-4">

                <h6 class="fw-bold">

                    Orders

                </h6>


                <p class="mb-2">

                    <a href="MyOrdersServlet"
                       class="footer-link">

                        My Orders

                    </a>

                </p>


                <p class="mb-2">

                    Track your orders easily.

                </p>

            </div>


            <!-- Contact -->

            <div class="col-md-3 mb-4">

                <h6 class="fw-bold">

                    Contact

                </h6>


                <p class="text-secondary mb-2">

                    📧 support@curiocart.com

                </p>


                <p class="text-secondary mb-2">

                    📞 +91 98765 43210

                </p>

            </div>

        </div>


        <hr class="border-secondary">


        <div class="text-center">

            <p class="mb-0 text-secondary">

                © 2026 Curiocart.
                All Rights Reserved.

            </p>

        </div>

    </div>

</footer>

<!-- Bootstrap JS -->
<script
    src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js">
</script>


</body>

</html>