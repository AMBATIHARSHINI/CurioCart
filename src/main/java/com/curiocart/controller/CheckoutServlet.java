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
import com.curiocart.model.Product;
import com.curiocart.model.User;

@WebServlet("/CheckoutServlet")
public class CheckoutServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request,
                         HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();

        User user = (User) session.getAttribute("user");

        if(user == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        CartDAO dao = new CartDAO();

        List<Product> cartItems =
                dao.getCartItems(user.getId());

        if(cartItems == null || cartItems.isEmpty()) {
            response.sendRedirect("cart.jsp");
            return;
        }

        double total = 0;

        for(Product product : cartItems) {

            total = total +
                    (product.getPrice()
                    * product.getQuantity());
        }

        request.setAttribute("cartItems", cartItems);
        request.setAttribute("total", total);

        request.getRequestDispatcher("checkout.jsp")
               .forward(request, response);
    }
}