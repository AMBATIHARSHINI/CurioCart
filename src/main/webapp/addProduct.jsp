<%@ page language="java"
         contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
 <%@ page import="com.curiocart.model.User" %>
         
<%
    User adminUser = (User) session.getAttribute("user");

    if (adminUser == null || !adminUser.getRole().equals("ADMIN")) {

        response.sendRedirect("login.jsp");
        return;
    }
%>

<!DOCTYPE html>
<html>

<head>

    <title>Curiocart-Add Product</title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
          rel="stylesheet">

    <link rel="stylesheet" href="MyStyle.css">

</head>

<body>

    <%@ include file="navbar.jsp" %>

    <div class="container">

        <div class="form-container">

            <h2 class="text-center mb-4">
                Add Product
            </h2>

            <form action="AddProductServlet" method="post">

                <div class="mb-3">

                    <label class="form-label">
                        Product Name
                    </label>

                    <input type="text"
                           name="name"
                           class="form-control"
                           placeholder="Enter product name"
                           required>

                </div>


                <div class="mb-3">

                    <label class="form-label">
                        Description
                    </label>

                    <textarea name="description"
                              class="form-control"
                              placeholder="Enter product description"
                              rows="3"></textarea>

                </div>


                <div class="mb-3">

                    <label class="form-label">
                        Price
                    </label>

                    <input type="number"
                           name="price"
                           class="form-control"
                           step="0.01"
                           placeholder="Enter price"
                           required>

                </div>


                <div class="mb-3">

                    <label class="form-label">
                        Discount (%)
                    </label>

                    <input type="number"
                           name="discount"
                           class="form-control"
                           step="0.01"
                           value="0">

                </div>


                <div class="mb-3">

                    <label class="form-label">
                        Quantity
                    </label>

                    <input type="number"
                           name="quantity"
                           class="form-control"
                           placeholder="Enter stock quantity"
                           required>

                </div>


                <div class="mb-3">

                    <label class="form-label">
                        Category
                    </label>

                    <input type="text"
                           name="category"
                           class="form-control"
                           placeholder="Example: Electronics"
                           required>

                </div>


                <div class="mb-3">

                    <label class="form-label">
                        Image
                    </label>

                    <input type="text"
                           name="image"
                           class="form-control"
                           placeholder="Example: headphones.jpg">

                </div>


                <button type="submit"
                        class="btn btn-warning w-100">

                    Add Product

                </button>

            </form>

        </div>

    </div>


    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js">
    </script>

</body>

</html>