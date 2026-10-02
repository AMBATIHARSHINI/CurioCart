package com.curiocart.controller;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import com.curiocart.dao.ProductDAO;
import com.curiocart.model.Product;
import com.curiocart.model.User;

@WebServlet("/AddProductServlet")
public class AddProductServlet extends HttpServlet {

    protected void doPost(
            HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        // Check admin
        HttpSession session = request.getSession();

        User adminUser = (User) session.getAttribute("user");

        if (adminUser == null || !adminUser.getRole().equals("ADMIN")) {

            response.sendRedirect("login.jsp");

            return;
        }

        String name = request.getParameter("name");
        String description = request.getParameter("description");

        double price = Double.parseDouble(
                request.getParameter("price"));

        double discount = Double.parseDouble(
                request.getParameter("discount"));

        int quantity = Integer.parseInt(
                request.getParameter("quantity"));

        String category = request.getParameter("category");
        String image = request.getParameter("image");


        Product product = new Product();

        product.setName(name);
        product.setDescription(description);
        product.setPrice(price);
        product.setDiscount(discount);
        product.setQuantity(quantity);
        product.setCategory(category);
        product.setImage(image);


        ProductDAO dao = new ProductDAO();

        String status = dao.addProduct(product);
        System.out.println("Status: " + status);
        System.out.println("Session user: " + session.getAttribute("user"));
        System.out.println("Role: " + adminUser.getRole());
        if (status.equals("success")) {

            response.sendRedirect("addProduct.jsp");

        } else {

            response.sendRedirect("addProduct.jsp");
        }
    }
}