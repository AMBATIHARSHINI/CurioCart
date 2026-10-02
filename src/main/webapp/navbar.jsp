<%@ page import="com.curiocart.model.User" %>

<%
    User user = (User) session.getAttribute("user");
%>

<nav class="navbar navbar-expand-lg navbar-dark bg-dark">

    <div class="container">

        <a class="navbar-brand" href="index.jsp">
            Curiocart
        </a>

        <button class="navbar-toggler"
                type="button"
                data-bs-toggle="collapse"
                data-bs-target="#navbarContent">

            <span class="navbar-toggler-icon"></span>

        </button>

        <div class="collapse navbar-collapse" id="navbarContent">

            <ul class="navbar-nav ms-auto">

                <% if (user == null) { %>

                    <li class="nav-item">
                        <a class="nav-link" href="register.jsp">
                            Register
                        </a>
                    </li>

                    <li class="nav-item">
                        <a class="nav-link" href="login.jsp">
                            Login
                        </a>
                    </li>

                <% } else { %>

                    <li class="nav-item">
                        <a class="nav-link" href="home.jsp">
                            Home
                        </a>
                    </li>

                    <li class="nav-item">
                        <a class="nav-link" href="LogoutServlet">
                            Logout
                        </a>
                    </li>

                <% } %>

            </ul>

        </div>

    </div>

</nav>