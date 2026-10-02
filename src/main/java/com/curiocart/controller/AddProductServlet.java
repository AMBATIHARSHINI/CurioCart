package com.curiocart.controller;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import com.curiocart.dao.ProductDAO;
import com.curiocart.model.Product;

@WebServlet("/AddProductServlet")
public class AddProductServlet extends HttpServlet {

    protected void doPost(
            HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

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


        if (status.equals("success")) {

            response.sendRedirect("addProduct.jsp");

        } else {

            response.sendRedirect("addProduct.jsp");
        }
    }
}