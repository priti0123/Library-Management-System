package dao;

import model.Book;
import util.DBConnection;
import java.sql.*;
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.temporal.ChronoUnit;
import java.util.*;

public class BookDAO {
    public boolean addBook(Book book) throws Exception {
    	boolean success = false;
    	
    	try {
    		 Connection con = DBConnection.getConnection();
    	        PreparedStatement ps = con.prepareStatement("INSERT INTO books (title, author, is_issued , book_name) VALUES (?, ?, ? , ?)");
    	        ps.setString(1, book.getTitle());
    	        ps.setString(2, book.getAuthor());
    	        ps.setBoolean(3, false);
    	        ps.setString(4 , book.getName());
    	        int rowsAffected = ps.executeUpdate(); 
    	        
    	        if(rowsAffected > 0 ) {
    	        	success = true;
    	        }
    	        
    	      con.close();
    	     
    	}
    	catch (SQLException e) {
            e.printStackTrace();
        }
      
    	 return success;   
      
    }

    public List<Book> getAllBooks() throws Exception {
        Connection con = DBConnection.getConnection();
        Statement stmt = con.createStatement();
        ResultSet rs = stmt.executeQuery("SELECT * FROM books order by id asc");
        List<Book> list = new ArrayList<>();
        while (rs.next()) {
            Book b = new Book();
            b.setId(rs.getInt("id"));
            b.setTitle(rs.getString("title"));
            b.setAuthor(rs.getString("author"));
            b.setIssued(rs.getBoolean("is_issued"));
            b.setName(rs.getString("book_name"));
            list.add(b);
        }
        con.close();
        return list;
    }

    public void issueBook(int id) throws Exception {
        Connection con = DBConnection.getConnection();
        PreparedStatement ps = con.prepareStatement("UPDATE books SET is_issued = ? WHERE id = ?");
        ps.setBoolean(1, true);
        ps.setInt(2, id);
        ps.executeUpdate();
        con.close();
    }

    
    public static boolean bookExists(int bookId) throws Exception {
    	 Connection con = DBConnection.getConnection();
         PreparedStatement ps = con.prepareStatement("Select * from books where id = ?");
         ps.setInt(1, bookId);
         ResultSet rs = ps.executeQuery();
         boolean exists = false;
         if(rs.next()) {
        	 exists = true;
         }
		 return exists;
		   
		  
	 }

    
// Method for returning book
    public void returnBook(int id, String returndate) throws Exception {
        Connection con = DBConnection.getConnection();
     // Validate input date format
    	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        sdf.setLenient(false); // prevent invalid dates like 32-01-2025

        java.util.Date udate = sdf.parse(returndate);
        long l = udate.getTime();
        java.sql.Date sdate = new java.sql.Date(l);
        
        if(sdate != null) {
          
            PreparedStatement ps = con.prepareStatement("UPDATE books SET is_issued = ?  WHERE id = ?");
            ps.setBoolean(1,false);
            ps.setInt(2, id);
            ps.executeUpdate();
            
            PreparedStatement ps1 = con.prepareStatement("UPDATE issued_books SET return_date = ?  WHERE book_id = ?");
            ps1.setDate(1, sdate);
            ps1.setInt(2, id);
            ps1.executeUpdate();
            BookDAO.totalFineCalculation(id, sdate);
        }
      
        con.close();
    }

    public boolean deleteBook(int bookId) throws Exception {
    	 if (isBookIssued(bookId)) {
    	        return false; // You can use a custom exception or return a status
    	    }
        boolean success = false;

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement("DELETE FROM books WHERE id = ?")) {

            ps.setInt(1, bookId);
            int rowsAffected = ps.executeUpdate();
            success = rowsAffected > 0;

        } catch (SQLException e) {
            e.printStackTrace();
        }

       return success;
    }

    
    
    
    public boolean isBookIssued(int id) throws Exception {
        Connection con = DBConnection.getConnection();
        PreparedStatement ps = con.prepareStatement("SELECT is_issued FROM books WHERE id = ?");
        ps.setInt(1, id);
        ResultSet rs = ps.executeQuery();
        boolean issued = false;
        if (rs.next()) {
            issued = rs.getBoolean("is_issued");
        }
        con.close();
        return issued;
    }

    
    public List<Book> searchBooks(String keyword) throws Exception {
        List<Book> books = new ArrayList<>();
        String likeKeyword = "%" + keyword.toLowerCase() + "%";

        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(
                 "SELECT * FROM books WHERE LOWER(title) LIKE ? OR LOWER(author) LIKE ? OR LOWER(book_name) LIKE ?")) {

            ps.setString(1, likeKeyword);
            ps.setString(2, likeKeyword);
            ps.setString(3, likeKeyword);

            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Book book = new Book();
                book.setId(rs.getInt("id"));
                book.setTitle(rs.getString("title"));
                book.setAuthor(rs.getString("author"));
                book.setName(rs.getString("book_name"));
                book.setIssued(rs.getBoolean("is_issued")); // Corrected column name
                books.add(book);
            }
        }
        return books;
    }
    
    
    // methods of calculate fine

    public static double calculateLateFee(Date issueDate  , Date returnDate) {
    	
    	 int DUE_DAYS = 14;
    	 double LATE_FEE_PER_DAY = 10.0;
    	 LocalDate  issue = issueDate.toLocalDate();
    	 LocalDate returned = returnDate.toLocalDate();
    	 long daysBetween = ChronoUnit.DAYS.between(issue, returned);

         if (daysBetween > DUE_DAYS) {
             return (daysBetween - DUE_DAYS) * LATE_FEE_PER_DAY;
         }
         return 0.0;
     }
    	  	
    
    
    
    //  Transaction details
 // Method to calculate and store transaction when book is returned
    public static void totalFineCalculation(int bookId, Date returndate) {
        Connection con = null;
        PreparedStatement ps1, ps2 , ps3;
        ResultSet rs;

        try {
            // Use your DBConnection class instead of hardcoding
            con = DBConnection.getConnection();

            // 1. Get issue details
            ps1 = con.prepareStatement("SELECT id, student_id, issue_date FROM issued_books WHERE book_id=?");
            ps1.setInt(1, bookId);
            rs = ps1.executeQuery();
            
            

            if (rs.next()) {
                int issueId = rs.getInt("id");
                int studentId = rs.getInt("student_id");
                Date issueDate = rs.getDate("issue_date");

                // 2. Calculate fine
                double fee = calculateLateFee(issueDate, returndate);

                
         
               
                // 3. Insert into transactions
                ps2 = con.prepareStatement(
                    "INSERT INTO transactions(student_id, book_id, issue_id, amount, description) VALUES(?,?,?,?,?)"
                );
                
            
                
                ps2.setInt(1, studentId);
                ps2.setInt(2, bookId);
                ps2.setInt(3, issueId);
                ps2.setDouble(4, fee);
                ps2.setString(5, (fee > 0 ? "Late fee charged" : "Returned on time"));
                ps2.executeUpdate();
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                if (con != null) con.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
    }


}
