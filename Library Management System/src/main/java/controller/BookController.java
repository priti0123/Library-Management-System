package controller;

import dao.BookDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Book;

import java.io.IOException;

@WebServlet("/bookcontroller")
public class BookController extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        BookDAO dao = new BookDAO();

        if (action == null) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Missing action parameter");
            return;
        }

        try {
            if ("add".equalsIgnoreCase(action)) {
                Book book = new Book();
                book.setTitle(request.getParameter("title"));
                book.setAuthor(request.getParameter("author"));
                book.setName(request.getParameter("bookname"));

                boolean success = dao.addBook(book);

                if (success) {
                    response.sendRedirect("viewBooks.jsp");
                } else {
                    response.sendRedirect("addBook.jsp?error=1");
                }

            } else if ("delete".equalsIgnoreCase(action)) {
                try {
                    int id = Integer.parseInt(request.getParameter("id"));

                    if (dao.isBookIssued(id)) {
                        // Redirect or show message: Book can't be deleted
                    	 request.setAttribute("message", "Book is issued ! You cant't delete ");
                         request.getRequestDispatcher("error.jsp").forward(request, response);
                    }

                    boolean success = dao.deleteBook(id);
                    if (success) {
                        response.sendRedirect("viewBooks.jsp");
                    } else {
                    	
                    	 request.setAttribute("message", "Book Id is not found !  ");
                         request.getRequestDispatcher("error.jsp").forward(request, response);
                    }
                } catch (NumberFormatException e) {
                    response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid book ID format");
                }
            } else {
                response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Unknown action: " + action);
            }

        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("error", "An internal error occurred: " + e.getMessage());
            request.getRequestDispatcher("error.jsp").forward(request, response);
        }
    }
}
