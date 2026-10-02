<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>

    <title>Curiocart-Main</title>

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
          rel="stylesheet">

    <!-- Common CSS -->
    <link rel="stylesheet" href="MyStyle.css">

</head>

<body>

    <!-- Include Common Navbar -->
    <%@ include file="navbar.jsp" %>


    <!-- Home Section -->

    <section class="home-section">

        <div class="container">

            <div class="row align-items-center">

                <!-- Left Content -->

                <div class="col-lg-6">

                    <h1 class="home-title">

                        Welcome to <span>Curiocart</span>

                    </h1>


                    <p class="home-description mt-4">

                        Discover amazing products and enjoy a simple,
                        secure and convenient online shopping experience.

                    </p>


                    <div class="mt-4">

                        <a href="register.jsp"
                           class="btn btn-warning btn-lg me-2">

                            Get Started

                        </a>


                        <a href="login.jsp"
                           class="btn btn-dark btn-lg">

                            Login

                        </a>

                    </div>

                </div>


                <!-- Right Content -->

                <div class="col-lg-6 mt-5 mt-lg-0">

                    <div class="home-card text-center">

                        <div class="display-1">

                            🛒

                        </div>


                        <h2 class="fw-bold mt-3">

                            Shop. Explore. Enjoy.

                        </h2>


                        <p class="text-muted">

                            Everything you need, all in one place.

                        </p>

                    </div>

                </div>

            </div>

        </div>

    </section>


    <!-- Bootstrap JavaScript -->

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js">
    </script>

</body>

</html>