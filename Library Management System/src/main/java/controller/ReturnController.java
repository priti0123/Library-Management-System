package controller;

import dao.BookDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet("/returncontroller")
public class ReturnController extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int bookId = Integer.parseInt(request.getParameter("bookId"));
        String returndate = request.getParameter("returndate");
        String username = (String) request.getSession().getAttribute("username");

        try {
            BookDAO dao = new BookDAO();
            dao.returnBook(bookId ,returndate ); // Sets is_issued = false

            // Optional: update return_date in issued_books
            response.sendRedirect("issuedBooks.jsp");
            
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("message", "Error returning book.  ");
            request.getRequestDispatcher("error.jsp").forward(request, response);
        }
    }
}
