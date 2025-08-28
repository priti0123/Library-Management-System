package controller;

import dao.BookDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.Date;

@WebServlet("/returncontroller")
public class ReturnController extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	
        int bookId = Integer.parseInt(request.getParameter("bookId"));
        String returndateStr = request.getParameter("returndate");
        String username = (String) request.getSession().getAttribute("username");
        
        // Convert String -> java.sql.Date
      //  Date returndate = Date.valueOf(returndateStr); // Format: yyyy-MM-dd

        try {
            BookDAO dao = new BookDAO();
            
            if(!dao.isBookIssued(bookId)) {
            	 request.setAttribute("message", "Book is not Issued ! Please enter valid issued book id to return");
                 request.getRequestDispatcher("error.jsp").forward(request, response);
                 return;
            }
            dao.returnBook(bookId ,returndateStr ); // Sets is_issued = false
            

            // Optional: update return_date in issued_books
            response.sendRedirect("issuedBooks.jsp");
            
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("message", "Error returning book.  ");
            request.getRequestDispatcher("error.jsp").forward(request, response);
        }
    }
}
