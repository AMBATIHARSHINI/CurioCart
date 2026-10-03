package com.curiocart.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.curiocart.model.Product;
import com.curiocart.util.DBConnection;

public class ProductDAO {

    Connection con = null;

    public String addProduct(Product product) {

        String status = "";

        try {

            DBConnection db = new DBConnection();
            con = db.getConnection();

            String sql = "INSERT INTO products(name, description, price, discount, quantity, category, image) "
                       + "VALUES (?, ?, ?, ?, ?, ?, ?)";

            PreparedStatement ps = con.prepareStatement(sql);

            ps.setString(1, product.getName());
            ps.setString(2, product.getDescription());
            ps.setDouble(3, product.getPrice());
            ps.setDouble(4, product.getDiscount());
            ps.setInt(5, product.getQuantity());
            ps.setString(6, product.getCategory());
            ps.setString(7, product.getImage());

            int rows = ps.executeUpdate();

            if (rows > 0) {
                status = "success";
            } else {
                status = "failed";
            }

        } catch (Exception e) {

            System.out.println(e);
            status = "failed";
        }

        return status;
    }
    public List<Product> getAllProducts() {

        List<Product> products = new ArrayList<>();

        try {

            DBConnection db = new DBConnection();
            con = db.getConnection();

            String sql = "SELECT * FROM products";

            PreparedStatement ps = con.prepareStatement(sql);

            ResultSet rs = ps.executeQuery();

            while (rs.next()) {

                Product product = new Product();

                product.setId(rs.getInt("id"));
                product.setName(rs.getString("name"));
                product.setDescription(rs.getString("description"));
                product.setPrice(rs.getDouble("price"));
                product.setDiscount(rs.getDouble("discount"));
                product.setQuantity(rs.getInt("quantity"));
                product.setCategory(rs.getString("category"));
                product.setImage(rs.getString("image"));

                products.add(product);
            }

        } catch (Exception e) {

            System.out.println(e);
        }

        return products;
    }
    public Product getProductById(int id) {

        Product product = null;

        try {

            DBConnection db = new DBConnection();
            con = db.getConnection();

            String sql = "SELECT * FROM products WHERE id = ?";

            PreparedStatement ps = con.prepareStatement(sql);

            ps.setInt(1, id);

            ResultSet rs = ps.executeQuery();

            if (rs.next()) {

                product = new Product();

                product.setId(rs.getInt("id"));
                product.setName(rs.getString("name"));
                product.setDescription(rs.getString("description"));
                product.setPrice(rs.getDouble("price"));
                product.setDiscount(rs.getDouble("discount"));
                product.setQuantity(rs.getInt("quantity"));
                product.setCategory(rs.getString("category"));
                product.setImage(rs.getString("image"));
            }

        } catch (Exception e) {
            System.out.println(e);
        }

        return product;
    }
    public String reduceStock(int productId, int quantity) {

        String status = "";

        try {

            DBConnection db = new DBConnection();
            con = db.getConnection();

            String sql = "UPDATE products "
                       + "SET quantity = quantity - ? "
                       + "WHERE id = ? "
                       + "AND quantity >= ?";

            PreparedStatement ps = con.prepareStatement(sql);

            ps.setInt(1, quantity);
            ps.setInt(2, productId);
            ps.setInt(3, quantity);

            int rows = ps.executeUpdate();

            if(rows > 0) {
                status = "success";
            }
            else {
                status = "failed";
            }

        }
        catch(Exception e) {

            System.out.println(e);
            status = "failed";
        }

        return status;
    }
    public List<Product> searchProducts(String search) {

        List<Product> products = new ArrayList<>();

        try {

            DBConnection db = new DBConnection();
            con = db.getConnection();

            String sql = "SELECT * FROM products "
                       + "WHERE name LIKE ? "
                       + "OR category LIKE ?";

            PreparedStatement ps =
                    con.prepareStatement(sql);

            ps.setString(1, "%" + search + "%");
            ps.setString(2, "%" + search + "%");

            ResultSet rs = ps.executeQuery();

            while(rs.next()) {

                Product product = new Product();

                product.setId(
                        rs.getInt("id"));

                product.setName(
                        rs.getString("name"));

                product.setDescription(
                        rs.getString("description"));

                product.setPrice(
                        rs.getDouble("price"));

                product.setDiscount(
                        rs.getDouble("discount"));

                product.setQuantity(
                        rs.getInt("quantity"));

                product.setCategory(
                        rs.getString("category"));

                product.setImage(
                        rs.getString("image"));

                products.add(product);
            }

        }
        catch(Exception e) {

            System.out.println(e);
        }

        return products;
    }
    public List<Product> searchProductsByCategory(String category) {

        List<Product> products = new ArrayList<>();

        try {

            DBConnection db = new DBConnection();
            con = db.getConnection();

            String sql = "SELECT * FROM products "
                       + "WHERE category = ?";

            PreparedStatement ps =
                    con.prepareStatement(sql);

            ps.setString(1, category);

            ResultSet rs = ps.executeQuery();

            while(rs.next()) {

                Product product = new Product();

                product.setId(
                        rs.getInt("id"));

                product.setName(
                        rs.getString("name"));

                product.setDescription(
                        rs.getString("description"));

                product.setPrice(
                        rs.getDouble("price"));

                product.setDiscount(
                        rs.getDouble("discount"));

                product.setQuantity(
                        rs.getInt("quantity"));

                product.setCategory(
                        rs.getString("category"));

                product.setImage(
                        rs.getString("image"));

                products.add(product);
            }

        }
        catch(Exception e) {

            System.out.println(e);
        }

        return products;
    }
}