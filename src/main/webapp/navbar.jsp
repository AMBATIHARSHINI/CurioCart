<%@ page import="com.curiocart.model.User" %>

<%
    User user = (User) session.getAttribute("user");
%>

<nav class="navbar navbar-expand-lg navbar-dark bg-dark">

    <div class="container">

        <!-- Logo / Brand -->

        <a class="navbar-brand" href="home.jsp">
            Curiocart
        </a>


        <!-- Mobile Menu Button -->

        <button class="navbar-toggler"
                type="button"
                data-bs-toggle="collapse"
                data-bs-target="#navbarContent">

            <span class="navbar-toggler-icon"></span>

        </button>


        <!-- Navigation Links -->

        <div class="collapse navbar-collapse"
             id="navbarContent">

            <ul class="navbar-nav ms-auto">


                <% if (user == null) { %>


                    <!-- Register -->

                    <li class="nav-item">

                        <a class="nav-link"
                           href="register.jsp">

                            Register

                        </a>

                    </li>


                    <!-- Login -->

                    <li class="nav-item">

                        <a class="nav-link"
                           href="login.jsp">

                            Login

                        </a>

                    </li>


                <% } else { %>


                    <!-- Home -->

                    <li class="nav-item">

                        <a class="nav-link"
                           href="home.jsp">

                            Home

                        </a>

                    </li>


                    <!-- Products -->

                    <li class="nav-item">

                        <a class="nav-link"
                           href="products.jsp">

                            Products

                        </a>

                    </li>


                    <!-- Cart -->

                    <li class="nav-item">

                        <a class="nav-link"
                           href="cart.jsp">

                            Cart

                        </a>

                    </li>


                    <!-- My Orders -->

                    <li class="nav-item">

                        <a class="nav-link"
                           href="MyOrdersServlet">

                            My Orders

                        </a>

                    </li>


                    <!-- Logout -->

                    <li class="nav-item">

                        <a class="nav-link"
                           href="LogoutServlet">

                            Logout

                        </a>

                    </li>


                <% } %>


            </ul>

        </div>

    </div>

</nav>