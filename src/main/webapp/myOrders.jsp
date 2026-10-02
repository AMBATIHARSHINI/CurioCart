<%@ page import="java.util.List" %>
<%@ page import="com.curiocart.model.Order" %>
<%@ page import="com.curiocart.model.User" %>

<%
    User Checkuser =
            (User) session.getAttribute("user");

    if(Checkuser == null) {
        response.sendRedirect("login.jsp");
        return;
    }

    List<Order> orders =
            (List<Order>) request.getAttribute("orders");
%>

<!DOCTYPE html>
<html>

<head>

    <meta charset="UTF-8">

    <title>My Orders - Curiocart</title>

    <link
        href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
        rel="stylesheet">

    <link rel="stylesheet"
          href="css/MyStyle.css">

</head>

<body>

    <%@ include file="navbar.jsp" %>


    <div class="container mt-5">

        <h2 class="mb-4">
            My Orders
        </h2>


        <%
            if(orders == null || orders.isEmpty()) {
        %>

            <div class="card shadow-sm p-4 text-center">

                <h4>
                    No Orders Found
                </h4>

                <p class="text-muted">
                    You haven't placed any orders yet.
                </p>

                <a href="products.jsp"
                   class="btn btn-warning">
                    Start Shopping
                </a>

            </div>

        <%
            }
            else {
        %>


            <div class="row">

                <%
                    for(Order order : orders) {
                %>

                    <div class="col-md-6 mb-4">

                        <div class="card shadow-sm">

                            <div class="card-body">

                                <h5 class="card-title">
                                    Order #<%= order.getId() %>
                                </h5>

                                <hr>

                                <p>
                                    <strong>
                                        Order Date:
                                    </strong>

                                    <%= order.getOrderDate() %>
                                </p>

                                <p>
                                    <strong>
                                        Total Amount:
                                    </strong>

                                    &#8377;<%= order.getTotalAmount() %>
                                </p>

                                <p>
                                    <strong>
                                        Status:
                                    </strong>

                                    <span class="badge bg-success">
                                        <%= order.getStatus() %>
                                    </span>
                                </p>

                            </div>

                        </div>

                    </div>

                <%
                    }
                %>

            </div>


        <%
            }
        %>

    </div>

</body>

</html>