package com.curiocart.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import com.curiocart.model.Order;
import com.curiocart.util.DBConnection;

public class OrderDAO {

    Connection con = null;

    public int placeOrder(Order order) {

        int orderId = 0;

        try {

            DBConnection db = new DBConnection();
            con = db.getConnection();

            String sql = "INSERT INTO orders(user_id, total_amount, status) "
                       + "VALUES (?, ?, ?)";

            PreparedStatement ps =
                    con.prepareStatement(
                            sql,
                            java.sql.Statement.RETURN_GENERATED_KEYS
                    );

            ps.setInt(1, order.getUserId());
            ps.setDouble(2, order.getTotalAmount());
            ps.setString(3, order.getStatus());

            int rows = ps.executeUpdate();

            if(rows > 0) {

                ResultSet rs =
                        ps.getGeneratedKeys();

                if(rs.next()) {

                    orderId =
                            rs.getInt(1);
                }
            }

        }
        catch(Exception e) {

            System.out.println(e);
        }

        return orderId;
    }
    public List<Order> getOrdersByUserId(int userId) {

        List<Order> orders = new ArrayList<>();

        try {

            DBConnection db = new DBConnection();
            con = db.getConnection();

            String sql = "SELECT * FROM orders "
                       + "WHERE user_id = ? "
                       + "ORDER BY order_date DESC";

            PreparedStatement ps = con.prepareStatement(sql);

            ps.setInt(1, userId);

            ResultSet rs = ps.executeQuery();

            while(rs.next()) {

                Order order = new Order();

                order.setId(rs.getInt("id"));
                order.setUserId(rs.getInt("user_id"));
                order.setTotalAmount(
                        rs.getDouble("total_amount"));
                order.setOrderDate(
                        rs.getString("order_date"));
                order.setStatus(
                        rs.getString("status"));

                orders.add(order);
            }

        }
        catch(Exception e) {

            System.out.println(e);
        }

        return orders;
    }
    public List<Order> getAllOrders() {

        List<Order> orders = new ArrayList<>();

        try {

            DBConnection db = new DBConnection();
            con = db.getConnection();

            String sql = "SELECT * FROM orders "
                       + "ORDER BY id DESC";

            PreparedStatement ps =
                    con.prepareStatement(sql);

            ResultSet rs = ps.executeQuery();

            while(rs.next()) {

                Order order = new Order();

                order.setId(
                        rs.getInt("id"));

                order.setUserId(
                        rs.getInt("user_id"));

                order.setTotalAmount(
                        rs.getDouble("total_amount"));

                order.setOrderDate(
                        rs.getString("order_date"));

                order.setStatus(
                        rs.getString("status"));

                orders.add(order);
            }

        }
        catch(Exception e) {

            System.out.println(e);
        }

        return orders;
    }
    public String updateOrderStatus(int orderId, String status) {

        String result = "";

        try {

            DBConnection db = new DBConnection();
            con = db.getConnection();

            String sql = "UPDATE orders "
                       + "SET status = ? "
                       + "WHERE id = ?";

            PreparedStatement ps =
                    con.prepareStatement(sql);

            ps.setString(1, status);
            ps.setInt(2, orderId);

            int rows = ps.executeUpdate();

            if(rows > 0) {

                result = "success";

            }
            else {

                result = "failed";
            }

        }
        catch(Exception e) {

            System.out.println(e);

            result = "failed";
        }

        return result;
    }
}