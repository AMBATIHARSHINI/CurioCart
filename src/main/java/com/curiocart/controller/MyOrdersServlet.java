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
import com.curiocart.dao.OrderItemDAO;
import com.curiocart.model.Order;
import com.curiocart.model.OrderItem;
import com.curiocart.model.User;

@WebServlet("/MyOrdersServlet")
public class MyOrdersServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request,
                         HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();

        User user =
                (User) session.getAttribute("user");

        if(user == null) {

            response.sendRedirect("login.jsp");
            return;
        }

        // Get user's orders
        OrderDAO orderDAO = new OrderDAO();

        List<Order> orders =
                orderDAO.getOrdersByUserId(
                        user.getId()
                );

        // Get order items
        OrderItemDAO orderItemDAO =
                new OrderItemDAO();

        // Store all order items
        java.util.Map<Integer, List<OrderItem>> orderItemsMap =
                new java.util.HashMap<>();

        for(Order order : orders) {

            List<OrderItem> items =
                    orderItemDAO.getOrderItems(
                            order.getId()
                    );

            orderItemsMap.put(
                    order.getId(),
                    items
            );
        }

        request.setAttribute(
                "orders",
                orders
        );

        request.setAttribute(
                "orderItemsMap",
                orderItemsMap
        );

        request.getRequestDispatcher(
                "myOrders.jsp"
        ).forward(request, response);
    }
}