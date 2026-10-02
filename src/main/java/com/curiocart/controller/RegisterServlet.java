package com.curiocart.controller;

import java.io.IOException;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import com.curiocart.dao.UserDAO;
import com.curiocart.model.User;

@WebServlet("/RegisterServlet")
public class RegisterServlet extends HttpServlet {

    protected void doPost(
            HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        User user = new User();

        user.setName(name);
        user.setEmail(email);
        user.setPassword(password);
        user.setRole("CUSTOMER");

        UserDAO dao = new UserDAO();

        String status = dao.registerUser(user);
        System.out.println("Registration Status: " + status);
        if (status.equals("success")) {

            RequestDispatcher rd =
                    request.getRequestDispatcher("login.jsp");

            rd.forward(request, response);

        } else {

            RequestDispatcher rd =
                    request.getRequestDispatcher("register.jsp");

            rd.forward(request, response);
        }
    }
}