package com.curiocart.controller;

import java.io.IOException;
import java.util.List;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import com.curiocart.dao.OrderDAO;
import com.curiocart.model.Order;
import com.curiocart.model.User;

@WebServlet("/MyOrdersServlet")
public class MyOrdersServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request,
                         HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();

        User user =
                (User) session.getAttribute("user");

        // Check login
        if(user == null) {

            response.sendRedirect("login.jsp");
            return;
        }

        // Get user's orders
        OrderDAO dao = new OrderDAO();

        List<Order> orders =
                dao.getOrdersByUserId(user.getId());

        // Send orders to JSP
        request.setAttribute("orders", orders);

        request.getRequestDispatcher("myOrders.jsp")
               .forward(request, response);
    }
}