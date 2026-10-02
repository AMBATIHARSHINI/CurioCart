<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>

<head>

    <title>Curiocart-Register</title>

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
          rel="stylesheet">

    <!-- Common CSS -->
    <link rel="stylesheet" href="MyStyle.css">

</head>

<body>

    <!-- Include Common Navbar -->
    <%@ include file="navbar.jsp" %>


    <!-- Registration Section -->

    <section class="auth-section">

        <div class="container">

            <div class="row justify-content-center">

                <div class="col-md-6 col-lg-5">

                    <div class="auth-card">

                        <h2 class="auth-title">

                            Create Account

                        </h2>


                        <p class="auth-subtitle">

                            Join Curiocart and start shopping

                        </p>


                        <!-- Registration Form -->

                        <form action="RegisterServlet" method="post">


                            <!-- Name -->

                            <div class="mb-3">

                                <label class="form-label">

                                    Name

                                </label>


                                <input type="text"
                                       name="name"
                                       class="form-control"
                                       placeholder="Enter your name"
                                       required>

                            </div>


                            <!-- Email -->

                            <div class="mb-3">

                                <label class="form-label">

                                    Email

                                </label>


                                <input type="email"
                                       name="email"
                                       class="form-control"
                                       placeholder="Enter your email"
                                       required>

                            </div>


                            <!-- Password -->

                            <div class="mb-4">

                                <label class="form-label">

                                    Password

                                </label>


                                <input type="password"
                                       name="password"
                                       class="form-control"
                                       placeholder="Enter your password"
                                       required>

                            </div>


                            <!-- Register Button -->

                            <button type="submit"
                                    class="btn btn-warning auth-btn">

                                Register

                            </button>

                        </form>


                        <!-- Login Link -->

                        <p class="text-center mt-4">

                            Already have an account?

                            <a href="login.jsp"
                               class="auth-link">

                                Login

                            </a>

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