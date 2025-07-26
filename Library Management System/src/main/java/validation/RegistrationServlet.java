package validation;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import util.DBConnection;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

@WebServlet("/reg")
public class RegistrationServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Get user input from form
        String name = request.getParameter("name");
        String uname = request.getParameter("uname");
        String role = request.getParameter("role");
        String pword = request.getParameter("pword");

        response.setContentType("text/html");
        PrintWriter out = response.getWriter();
        out.println("<html><body style='font-weight:bold'><center>");

        Connection con = null;
        PreparedStatement checkStmt = null;
        PreparedStatement insertStmt = null;
        ResultSet rs = null;

        try {
            con = DBConnection.getConnection();

            // Check if email already exists
            String checkQuery = "SELECT * FROM users WHERE username = ? and role = ? ";
            checkStmt = con.prepareStatement(checkQuery);
            checkStmt.setString(1, uname);
            checkStmt.setString(2, role);
            
            rs = checkStmt.executeQuery();

            if (!rs.next()) {
                // Email not found, proceed with registration
                String insertQuery = "INSERT INTO users (name,uname, role , pword) VALUES (?, ?, ?, ?)";
                insertStmt = con.prepareStatement(insertQuery);
                insertStmt.setString(1, name);
                insertStmt.setString(2, uname);
                insertStmt.setString(3, role);
                insertStmt.setString(4, pword); // ⚠️ Passwords should be hashed

                int rowCount = insertStmt.executeUpdate();

                if (rowCount > 0) {
                    response.sendRedirect("reg.jsp"); // success
                } else {
                    out.println("<h3 style='color:red;'>Registration failed. Please try again.</h3>");
                    out.println("<a href='Registration.html'>Try Again</a>");
                }

            } else {
                out.println("<h3 style='color:red;'>User already registered. Please try with user.</h3>");
                out.println("<a href='Registration.html'>Try Again</a>");
            }

        } catch (Exception e) {
            e.printStackTrace();
            out.println("<h3 style='color:red;'>An error occurred: " + e.getMessage() + "</h3>");

        } finally {
            try {
                if (rs != null) rs.close();
                if (checkStmt != null) checkStmt.close();
                if (insertStmt != null) insertStmt.close();
                if (con != null) con.close();
            } catch (Exception e) {
                e.printStackTrace();
                out.println("<h3 style='color:red;'>Error closing database resources.</h3>");
            }
        }
        
        out.println("</center></body></html>");
    }
}
