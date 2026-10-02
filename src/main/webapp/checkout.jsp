<%@ page import="java.util.List" %>
<%@ page import="com.curiocart.model.Product" %>
<%@ page import="com.curiocart.model.User" %>

<%

    User Checkuser = (User) session.getAttribute("user");

    if(Checkuser == null) {

        response.sendRedirect("login.jsp");

        return;

    }

    List<Product> cartItems =
            (List<Product>) request.getAttribute("cartItems");

    Double total =
            (Double) request.getAttribute("total");

%>

<!DOCTYPE html>

<html>

<head>

    <meta charset="UTF-8">

    <title>Checkout-Curiocart</title>

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

            Checkout

        </h2>


        <div class="row">


            <!-- Order Items -->

            <div class="col-md-8">

                <div class="card shadow-sm">

                    <div class="card-body">

                        <h4 class="mb-4">

                            Your Order

                        </h4>


                        <%

                            for(Product product : cartItems) {

                        %>


                            <div class="d-flex
                                        justify-content-between
                                        align-items-center
                                        border-bottom
                                        py-3">


                                <div>

                                    <h5>

                                        <%= product.getName() %>

                                    </h5>


                                    <p class="mb-0">

                                        &#8377;<%= product.getPrice() %>

                                        *

                                        <%= product.getQuantity() %>

                                    </p>

                                </div>


                                <strong>

                                    &#8377;<%= product.getPrice()
                                           * product.getQuantity() %>

                                </strong>


                            </div>


                        <%

                            }

                        %>


                    </div>

                </div>

            </div>



            <!-- Order Summary -->

            <div class="col-md-4">

                <div class="card shadow-sm">

                    <div class="card-body">

                        <h4>

                            Order Summary

                        </h4>


                        <hr>


                        <div class="d-flex
                                    justify-content-between">

                            <span>

                                Total

                            </span>


                            <strong>

                                &#8377;<%= total %>

                            </strong>

                        </div>


                        <form action="PlaceOrderServlet"
                              method="post">


                            <!-- Send total to PlaceOrderServlet -->

                            <input type="hidden"
                                   name="total"
                                   value="<%= total %>">


                            <button type="submit"
                                    class="btn btn-warning
                                           w-100 mt-4">

                                Place Order

                            </button>


                        </form>


                    </div>

                </div>

            </div>


        </div>

    </div>


</body>

</html>