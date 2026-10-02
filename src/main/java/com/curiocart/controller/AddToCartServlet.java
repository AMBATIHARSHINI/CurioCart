package com.curiocart.controller;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import com.curiocart.model.Cart;
import com.curiocart.model.User;
import com.curiocart.dao.CartDAO;

@WebServlet("/AddToCartServlet")
public class AddToCartServlet extends HttpServlet {

    protected void doPost(
            HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        // Get logged-in user
        HttpSession session = request.getSession();

        User user = (User) session.getAttribute("user");

        // Check login
        if (user == null) {

            response.sendRedirect("login.jsp");

            return;
        }

        // Get product ID
        int productId = Integer.parseInt(
                request.getParameter("productId"));

        // Default quantity = 1
        int quantity = 1;

        // Create Cart object
        Cart cart = new Cart();

        cart.setUserId(user.getId());
        cart.setProductId(productId);
        cart.setQuantity(quantity);

        // DAO
        CartDAO dao = new CartDAO();

        String status = dao.addToCart(cart);

        if (status.equals("success")) {

            response.sendRedirect("cart.jsp");

        } else {

            response.sendRedirect("productDetails.jsp?id=" + productId);
        }
    }
}