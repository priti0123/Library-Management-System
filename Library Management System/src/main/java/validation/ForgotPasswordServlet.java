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
import java.sql.SQLException;
import java.sql.Statement;

/**
 * Servlet implementation class ForgotPasswordServlet
 */
@WebServlet("/forgotpass")
public class ForgotPasswordServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
  
   
	
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String uname = request.getParameter("name");
		String newpass = request.getParameter("pword");
		
		try {
			Connection con = DBConnection.getConnection();
		    PreparedStatement st = con.prepareStatement("select * from users where username = ? ");
		    st.setString(1, uname);
			ResultSet rs = st.executeQuery();
			
			PrintWriter pw = response.getWriter();
			pw.println("<html><body><center>");
			
			if(rs.next()) {
				  PreparedStatement pst2 = con.prepareStatement("update users set pword = ? where email = ? and  role != 'admin'");
					pst2.setString(1, newpass);
					pst2.setString(2, uname);
					pst2.executeUpdate();
					pw.println("<h2>Your password is updated ! please Login </h2><br>");
					pw.println("<a href='Login.html'> Login</a>");
					
			}else {
				pw.println("<h2>Your username is wrong ! please provide registered username </h2><br>");
				pw.println("<a href='forgotPassword.html'>Try Again</a>");
			}
			
			pw.println("</center></body></html>");
			
			con.close();
		}catch(Exception e) {
			e.printStackTrace();
		}
	}

}
