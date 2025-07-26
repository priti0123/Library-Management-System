package validation;

import dao.UserDAO;
import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;

@WebServlet("/loginservlet")
public class LoginServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {

        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String role = request.getParameter("role");

        
        if (username == null || password == null || role == null ||  username.trim().isEmpty() || password.trim().isEmpty()) {
        	 request.setAttribute("message", "Invaid Credentials  ");
             request.getRequestDispatcher("error.jsp").forward(request, response);
             return;
         }

        boolean isValid = UserDAO.checkLogin(username, password, role);

        
        if (isValid) {
            HttpSession session = request.getSession();
            session.setAttribute("username", username);
            session.setAttribute("role", role);

//            if ("admin".equals(role)) {
//                 response.sendRedirect("dashboard_Admin.jsp");
//             } else {
//            	 response.sendRedirect("dashboard_Admin.jsp");
//             }
//            
            response.sendRedirect("dashboard_Admin.jsp");
            
            
        } else {
        	
        	 request.setAttribute("message", "Invalid Username / Password ");
             request.getRequestDispatcher("error.jsp").forward(request, response);
        }
    }
}
