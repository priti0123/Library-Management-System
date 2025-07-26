package dao;

import model.IssuedBook;
import util.DBConnection;

import java.sql.*;
import java.text.SimpleDateFormat;
import java.util.*;

public class IssuedBookDAO {

    // Issues a book by inserting a record into the database
    public void issueBook(int bookId, int studentId, String issuedate) throws Exception {
        // Validate input date format
    	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        sdf.setLenient(false); // prevent invalid dates like 32-01-2025

        java.util.Date udate = sdf.parse(issuedate);
        long l = udate.getTime();
        java.sql.Date sdate = new java.sql.Date(l);

        try (
            Connection con = DBConnection.getConnection();
            PreparedStatement ps = con.prepareStatement(
                "INSERT INTO issued_books (book_id, student_id, issue_date) VALUES (?, ?, ?)")
        ) {
            ps.setInt(1, bookId);
            ps.setInt(2, studentId);
            ps.setDate(3, sdate);
            ps.executeUpdate();
        } catch (SQLException e) {
            // Check for foreign key violation (student_id or book_id doesn't exist)
            if (e.getErrorCode() == 2291) {
                throw new SQLException("Foreign key violation: Check if Book ID or Student ID exists.", e);
            }
            throw e;
        }
    }

    // Retrieves all issued books from the database
    public List<IssuedBook> getIssuedBooks() throws Exception {
        List<IssuedBook> list = new ArrayList<>();

        try (
            Connection con = DBConnection.getConnection();
            Statement stmt = con.createStatement();
            ResultSet rs = stmt.executeQuery("SELECT * FROM issued_books")
        ) {
            while (rs.next()) {
                IssuedBook ib = new IssuedBook();
                ib.setId(rs.getInt("id"));
                ib.setBookId(rs.getInt("book_id"));
                ib.setStudentId(rs.getInt("student_id"));
                ib.setIssueDate(rs.getDate("issue_date"));
                ib.setReturnDate(rs.getDate("return_date"));
                list.add(ib);
            }
        }

        return list;
    }
}
