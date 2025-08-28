package controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import util.DBConnection;
import jakarta.servlet.RequestDispatcher;
import java.io.IOException;
import java.sql.*;
import java.util.*;

@WebServlet("/transactionsearchservlet")
public class TransactionSearchServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String studentIdStr = request.getParameter("studentId");  // must match JSP form field name
        List<Map<String, Object>> transactions = new ArrayList<>();

        try {
            int studentId = Integer.parseInt(studentIdStr);

        
            Connection con = DBConnection.getConnection();

            String sql = "SELECT * FROM transactions WHERE student_id = ? order by id";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, studentId);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                Map<String, Object> txn = new HashMap<>();
                txn.put("transaction_id", rs.getInt("transaction_id"));
                txn.put("student_id", rs.getInt("student_id"));
                txn.put("book_id", rs.getInt("book_id"));
                txn.put("issue_id", rs.getInt("issue_id"));
                txn.put("amount", rs.getDouble("amount"));
                txn.put("transaction_date", rs.getDate("transaction_date"));
                txn.put("description", rs.getString("description"));
                transactions.add(txn);
            }

            con.close();

        } catch (Exception e) {
            e.printStackTrace();
        }

        request.setAttribute("transactions", transactions);
        RequestDispatcher rd = request.getRequestDispatcher("transactionResult.jsp");
        rd.forward(request, response);
    }
}
