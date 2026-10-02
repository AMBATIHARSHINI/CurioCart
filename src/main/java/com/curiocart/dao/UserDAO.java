package com.curiocart.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.curiocart.util.DBConnection;
import com.curiocart.model.User;

public class UserDAO {

    Connection con = null;

    public String registerUser(User user) {

        String status = "";

        try {

            DBConnection db = new DBConnection();
            con = db.getConnection();

            String sql = "INSERT INTO users(name, email, password, role) VALUES (?, ?, ?, ?)";

            PreparedStatement ps = con.prepareStatement(sql);

            ps.setString(1, user.getName());
            ps.setString(2, user.getEmail());
            ps.setString(3, user.getPassword());
            ps.setString(4, user.getRole());

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


    public User loginUser(String email, String password) {

        User user = null;

        try {

            DBConnection db = new DBConnection();
            con = db.getConnection();

            String sql = "SELECT * FROM users WHERE email = ? AND password = ?";

            PreparedStatement ps = con.prepareStatement(sql);

            ps.setString(1, email);
            ps.setString(2, password);

            ResultSet rs = ps.executeQuery();

            if (rs.next()) {

                user = new User();

                user.setId(rs.getInt("id"));
                user.setName(rs.getString("name"));
                user.setEmail(rs.getString("email"));
                user.setPassword(rs.getString("password"));
                user.setRole(rs.getString("role"));
            }

        } catch (Exception e) {

            System.out.println(e);
        }

        return user;
    }
}