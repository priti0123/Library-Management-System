package controller;

import jakarta.servlet.ServletException;

import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Student;
import dao.StudentDAO;

import java.io.IOException;

@WebServlet("/studentcontroller")
public class StudentController extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	
    	String action = request.getParameter("action");
    	
    	StudentDAO sdao = new StudentDAO();
    	
    	 if (action == null) {
             response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Missing action parameter");
             return;
         }
    	try {
    	       if("add".equalsIgnoreCase(action)) {
    	
    	            // Retrieve and parse request parameters
    	            String enrollment = request.getParameter("enrollment");
    	            String name = request.getParameter("name");
    	            String email = request.getParameter("email");
    	            String course = request.getParameter("course");
    	            String gender = request.getParameter("gender");
    	            String dept = request.getParameter("department");
    	            int year = Integer.parseInt(request.getParameter("year"));
    	            int semester = Integer.parseInt(request.getParameter("semester"));
    	            long mob = Long.parseLong(request.getParameter("mob"));

    	            double fine = sdao.getTotalFine(enrollment);
    	            
    	            // Create and populate Student object
    	            Student student = new Student();
    	            student.setEnrollment(enrollment);
    	            student.setName(name);
    	            student.setEmail(email);
    	            student.setCourse(course);
    	            student.setGender(gender);
    	            student.setDept(dept);
    	            student.setYear(year);
    	            student.setSemester(semester);
    	            student.setMob(mob);
    	            if(fine != 0) {
    	            	student.setFine(fine);
    	            }
    	            

    	            // Save the student
    	            sdao.addStudent(student);

    	            // Redirect to view page
    	            response.sendRedirect("viewStudents.jsp");

    	            
    	       }
    	       
    	       
    	       else if ("delete".equalsIgnoreCase(action)) {
                    try {
                        String enrollment = request.getParameter("enrollment");
                         sdao.deleteStudent(enrollment);
                         response.sendRedirect("viewStudents.jsp");
                         
                     } catch (Exception e) {
                       response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid Student enrollment");
                      }

                    
                    
               } else {
                   response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Unknown action: " + action);
               }
    	       
    	       
    	       
       } catch (Exception e) {
    	  e.printStackTrace();  // For debugging only
          response.sendRedirect("error.jsp");  // Optional error page
       }
    	
       
    }
}
