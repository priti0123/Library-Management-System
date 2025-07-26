package controller;

import dao.BookDAO;
import model.Book;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;
import java.util.List;

@WebServlet("/searchbookcontroller")
public class SearchBookController extends HttpServlet {
    
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String query = request.getParameter("query");

        if (query == null || query.trim().isEmpty()) {
            request.setAttribute("error", "Please enter a search term.");
            request.getRequestDispatcher("error.jsp").forward(request, response);
            return;
        }

        try {
            List<Book> results = new BookDAO().searchBooks(query);
            request.setAttribute("books", results);
            request.getRequestDispatcher("searchResults.jsp").forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("error", "An error occurred while searching. Please try again.");
            request.getRequestDispatcher("error.jsp").forward(request, response);
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }
}
