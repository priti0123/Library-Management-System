package controller;

import jakarta.servlet.ServletException;

import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Date;

import dao.BookDAO;
import dao.IssuedBookDAO;
import dao.StudentDAO;

/**
 * Servlet implementation class IssueController
 */
@WebServlet("/issuecontroller")
public class IssueController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int bookId = Integer.parseInt(request.getParameter("bookId"));
        int studentId = Integer.parseInt(request.getParameter("studentId"));
        String issuedate = request.getParameter("issuedate");
        

        try {
            BookDAO bookDAO = new BookDAO();
            StudentDAO studentDAO = new StudentDAO();

            if (!studentDAO.studentExists(studentId)) {
                request.setAttribute("message", "Student does not exist!");
                request.getRequestDispatcher("error.jsp").forward(request, response);
                return;
            }
            
            if (!BookDAO.bookExists(bookId)) {
                request.setAttribute("message", "Book does not exist!");
                request.getRequestDispatcher("error.jsp").forward(request, response);
                return;
            }

            if (bookDAO.isBookIssued(bookId)) {
                request.setAttribute("message", "Book is already issued!");
                request.getRequestDispatcher("error.jsp").forward(request, response);
                return;
            }

            IssuedBookDAO issueDAO = new IssuedBookDAO();
            issueDAO.issueBook(bookId, studentId , issuedate);
            bookDAO.issueBook(bookId); // Set is_issued = true
            response.sendRedirect("issuedBooks.jsp");


        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}



