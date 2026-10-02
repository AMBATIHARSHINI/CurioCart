package com.curiocart.controller;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import com.curiocart.dao.CartDAO;
import com.curiocart.model.User;

@WebServlet("/UpdateCartServlet")
public class UpdateCartServlet extends HttpServlet {

    protected void doPost(
            HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        // Get session

        HttpSession session = request.getSession();


        // Get logged-in user

        User user = (User) session.getAttribute("user");


        // Check login

        if(user == null) {

            response.sendRedirect("login.jsp");

            return;
        }


        // Get product ID

        int productId = Integer.parseInt(
                request.getParameter("productId")
        );


        // Get action

        String action = request.getParameter("action");


        // Create DAO

        CartDAO dao = new CartDAO();


        // Increase quantity

        if(action.equals("increase")) {

            dao.increaseQuantity(
                    user.getId(),
                    productId
            );
        }


        // Decrease quantity

        else if(action.equals("decrease")) {

            dao.decreaseQuantity(
                    user.getId(),
                    productId
            );
        }


        // Remove product

        else if(action.equals("remove")) {

            dao.removeFromCart(
                    user.getId(),
                    productId
            );
        }


        // Go back to cart

        response.sendRedirect("cart.jsp");
    }
}