package com.curiocart.controller;

import java.io.IOException;
import java.util.List;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import com.curiocart.dao.CartDAO;
import com.curiocart.dao.OrderDAO;
import com.curiocart.dao.OrderItemDAO;
import com.curiocart.dao.ProductDAO;
import com.curiocart.model.Order;
import com.curiocart.model.OrderItem;
import com.curiocart.model.Product;
import com.curiocart.model.User;

@WebServlet("/PlaceOrderServlet")
public class PlaceOrderServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();

        User user =
                (User) session.getAttribute("user");

        if(user == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        // Get total
        String totalParameter =
                request.getParameter("total");

        double total =
                Double.parseDouble(totalParameter);

        // Get cart items
        CartDAO cartDAO = new CartDAO();

        List<Product> cartItems =
                cartDAO.getCartItems(user.getId());

        if(cartItems == null || cartItems.isEmpty()) {
            response.sendRedirect("cart.jsp");
            return;
        }

        // Create Order
        Order order = new Order();

        order.setUserId(user.getId());
        order.setTotalAmount(total);
        order.setStatus("PLACED");

        // Save Order
        OrderDAO orderDAO = new OrderDAO();

        int orderId =
                orderDAO.placeOrder(order);

        if(orderId > 0) {

            // Save Order Items
            OrderItemDAO orderItemDAO =
                    new OrderItemDAO();

            for(Product product : cartItems) {

                OrderItem item =
                        new OrderItem();

                item.setOrderId(orderId);

                item.setProductId(
                        product.getId());

                item.setQuantity(
                        product.getQuantity());

                item.setPrice(
                        product.getPrice());

                orderItemDAO.addOrderItem(item);
            }

            // Reduce Product Stock
            ProductDAO productDAO =
                    new ProductDAO();

            for(Product product : cartItems) {

                productDAO.reduceStock(
                        product.getId(),
                        product.getQuantity()
                );
            }

            // Clear Cart
            cartDAO.clearCart(user.getId());

            // Order Success
            response.sendRedirect(
                    "orderSuccess.jsp");

        }
        else {

            response.sendRedirect("cart.jsp");
        }
    }
}