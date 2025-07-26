package dao;

import java.sql.*;

import util.DBConnection;

public class UserDAO {
    public static boolean checkLogin(String username, String password, String role) {
        boolean valid = false;
        try {
           
            Connection con = DBConnection.getConnection();
               

            String sql = "SELECT * FROM users WHERE username=? AND password=? AND role=?";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, username);
            ps.setString(2, password);
            ps.setString(3, role);

            ResultSet rs = ps.executeQuery();
            valid = rs.next();

            rs.close();
            ps.close();
            con.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return valid;
    }
}
