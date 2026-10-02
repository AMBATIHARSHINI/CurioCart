package com.curiocart.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import com.curiocart.model.Product;
import com.curiocart.model.Cart;
import com.curiocart.util.DBConnection;

public class CartDAO {

    Connection con = null;

    public String addToCart(Cart cart) {

        String status = "";

        try {

            DBConnection db = new DBConnection();
            con = db.getConnection();


            // Check whether product already exists
            // in this user's cart

            String checkSql = "SELECT quantity FROM cart "
                            + "WHERE user_id = ? "
                            + "AND product_id = ?";

            PreparedStatement checkPs =
                    con.prepareStatement(checkSql);

            checkPs.setInt(1, cart.getUserId());
            checkPs.setInt(2, cart.getProductId());

            ResultSet rs = checkPs.executeQuery();


            if(rs.next()) {

                // Product already exists
                // Increase its quantity

                String updateSql = "UPDATE cart "
                                 + "SET quantity = quantity + ? "
                                 + "WHERE user_id = ? "
                                 + "AND product_id = ?";

                PreparedStatement updatePs =
                        con.prepareStatement(updateSql);

                updatePs.setInt(1, cart.getQuantity());
                updatePs.setInt(2, cart.getUserId());
                updatePs.setInt(3, cart.getProductId());

                int rows = updatePs.executeUpdate();

                if(rows > 0) {
                    status = "success";
                }
                else {
                    status = "failed";
                }

            }
            else {

                // Product does not exist
                // Add new product to cart

                String insertSql =
                        "INSERT INTO cart(user_id, product_id, quantity) "
                      + "VALUES (?, ?, ?)";

                PreparedStatement insertPs =
                        con.prepareStatement(insertSql);

                insertPs.setInt(1, cart.getUserId());
                insertPs.setInt(2, cart.getProductId());
                insertPs.setInt(3, cart.getQuantity());

                int rows = insertPs.executeUpdate();

                if(rows > 0) {
                    status = "success";
                }
                else {
                    status = "failed";
                }
            }

        }
        catch(Exception e) {

            System.out.println(e);

            status = "failed";
        }

        return status;
    }
    public List<Product> getCartItems(int userId) {

        List<Product> products = new ArrayList<>();

        try {

            DBConnection db = new DBConnection();
            con = db.getConnection();

            String sql = "SELECT p.*, c.quantity AS cart_quantity "
                       + "FROM cart c "
                       + "JOIN products p ON c.product_id = p.id "
                       + "WHERE c.user_id = ?";

            PreparedStatement ps = con.prepareStatement(sql);

            ps.setInt(1, userId);

            ResultSet rs = ps.executeQuery();

            while (rs.next()) {

                Product product = new Product();

                product.setId(rs.getInt("id"));

                product.setName(rs.getString("name"));

                product.setDescription(
                        rs.getString("description"));

                product.setPrice(
                        rs.getDouble("price"));

                product.setDiscount(
                        rs.getDouble("discount"));


                // Quantity currently in cart

                product.setQuantity(
                        rs.getInt("cart_quantity"));


                // Actual available stock

                product.setStockQuantity(
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
 // Increase cart quantity

    public String increaseQuantity(int userId, int productId) {

        String status = "";

        try {

            DBConnection db = new DBConnection();
            con = db.getConnection();

            String sql = "UPDATE cart c "
                       + "JOIN products p ON c.product_id = p.id "
                       + "SET c.quantity = c.quantity + 1 "
                       + "WHERE c.user_id = ? "
                       + "AND c.product_id = ? "
                       + "AND c.quantity < p.quantity";

            PreparedStatement ps = con.prepareStatement(sql);

            ps.setInt(1, userId);
            ps.setInt(2, productId);

            int rows = ps.executeUpdate();

            if(rows > 0) {
                status = "success";
            }
            else {
                status = "failed";
            }

        } catch(Exception e) {
            System.out.println(e);
            status = "failed";
        }

        return status;
    }
 // Decrease cart quantity

    public String decreaseQuantity(int userId, int productId) {

        String status = "";

        try {

            DBConnection db = new DBConnection();
            con = db.getConnection();

            String sql = "UPDATE cart "
                       + "SET quantity = quantity - 1 "
                       + "WHERE user_id = ? "
                       + "AND product_id = ? "
                       + "AND quantity > 1";

            PreparedStatement ps = con.prepareStatement(sql);

            ps.setInt(1, userId);
            ps.setInt(2, productId);

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
 // Remove product from cart

    public String removeFromCart(int userId, int productId) {

        String status = "";

        try {

            DBConnection db = new DBConnection();
            con = db.getConnection();

            String sql = "DELETE FROM cart "
                       + "WHERE user_id = ? "
                       + "AND product_id = ?";

            PreparedStatement ps = con.prepareStatement(sql);

            ps.setInt(1, userId);
            ps.setInt(2, productId);

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
    public String clearCart(int userId) {

        String status = "";

        try {

            DBConnection db = new DBConnection();
            con = db.getConnection();

            String sql = "DELETE FROM cart "
                       + "WHERE user_id = ?";

            PreparedStatement ps =
                    con.prepareStatement(sql);

            ps.setInt(1, userId);

            int rows = ps.executeUpdate();

            if(rows > 0) {
                status = "success";
            }
            else {
                status = "failed";
            }

        } catch(Exception e) {

            System.out.println(e);
            status = "failed";
        }

        return status;
    }
    
}