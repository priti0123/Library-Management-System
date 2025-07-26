<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="dao.StudentDAO, model.Student, java.util.*" %>

<%
    String username = (String) session.getAttribute("username");
    String role = (String) session.getAttribute("role");
    if (username == null ) {
        response.sendRedirect("index.html");
        return;
    }
%>

<!DOCTYPE html>
<html>
<head>
    <title>Student List</title>
      <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
  
      <script src="Header.js"></script>
      <link rel="stylesheet" href="headerDesign.css">
      <style>
          body {
            font-family: Arial, sans-serif;
            background-color: #f8d7da;
        }

     
        table {
            border-collapse: collapse;
            width: 95%;
            margin: 20px auto;
            background-color: white;
            box-shadow: 0 2px 8px rgba(0,0,0,0.1);
        }

        th, td {
            border: 1px solid #ccc;
            padding: 10px;
            text-align: center;
        }

        th {
            background-color:  #007bff;
            color: white;
        }

        tr:nth-child(even) {
            background-color: #f9f9f9;
        }

        tr:hover {
            background-color: #f1f1f1;
        }

        .action-link {
            display: block;
            text-align: center;
            margin-top: 20px;
        }

        .action-link a {
            background-color: #007BFF;
            color: white;
            padding: 10px 20px;
            text-decoration: none;
            border-radius: 5px;
            transition: background-color 0.3s ease;
            font-weight: bold;
        }

        .action-link a:hover {
            background-color: #0056b3;
        }
        
     .back-link {
            display: inline-block;
            margin-top: 15px;
            margin-left:630px;
            font-weight:bold;
            text-align:center;
            background-color: #007BFF;
            color: white;
            padding: 10px 20px;
            text-decoration: none;
            border-radius: 5px;
            transition: background-color 0.3s ease;
            font-weight: bold;
        }

        .back-link a:hover {
            background-color: #0056b3;
        }
       input[type="submit"]{
            background-color:red;
            color: white;
       }
        @media (max-width: 768px) {
            table, th, td {
                font-size: 12px;
            }

            .action-link a {
                padding: 8px 16px;
            }
        }
      
      
      </style>
</head>

<body>

    <!-- Header -->
    <div class="header-container">
        <h1><i class="fas fa-book"></i> Library Management System</h1>
        <div class="menu-icon" onclick="openNav()">
            <i class="fas fa-bars"></i>
        </div>
    </div>

    
        
        
         
           
        
        
          
           <!-- Sidebar -->
    <div id="mySidebar" class="sidebar">
       <a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a>
        
     <% if ("admin".equalsIgnoreCase(role)) { %>
        <a href="dashboard_Admin.jsp"><i class="fas fa-home"></i> Home</a>
        <a href="viewBooks.jsp"><i class="fas fa-book"></i> All Books</a>
        <a href="DeleteBook.jsp"><i class="fas fa-book"></i> Delete Books</a>
        <a href="addBook.jsp"><i class="fas fa-user-plus"></i> Add Books</a>
        <a href="addStudent.jsp"><i class="fas fa-user-plus"></i> Add Student</a>
        <a href="viewStudents.jsp"><i class="fas fa-users"></i> View Students</a>
        <a href="deleteStudent.jsp"><i class="fas fa-user-plus"></i> Delete Student</a>
        <a href="issueBook.jsp"><i class="fas fa-book-open"></i> Issue Book</a>
        <a href="issuedBooks.jsp"><i class="fas fa-history"></i> Issued Books</a>
        <a href="returnBook.jsp"><i class="fas fa-undo-alt"></i> Return Book</a>
        
      <% } else { %>
         
         <a href="dashboard_Admin.jsp"><i class="fas fa-home"></i> Home</a>
        <a href="viewBooks.jsp"><i class="fas fa-book"></i> All Books</a>
        <a href="viewStudents.jsp"><i class="fas fa-users"></i> View Students</a>
        <a href="addStudent.jsp"><i class="fas fa-user-plus"></i> Add Student</a>
        <a href="issueBook.jsp"><i class="fas fa-book-open"></i> Issue Book</a>
        <a href="issuedBooks.jsp"><i class="fas fa-history"></i> Issued Books</a>
        <a href="returnBook.jsp"><i class="fas fa-undo-alt"></i> Return Book</a>
        
      <% } %>
    </div>

    <!-- Title -->
    <h2>Registered Students</h2>

    <!-- Student Table -->
    <table>
        <tr>
            <th>ID</th>
            <th>Enrollment ID</th>
            <th>Name</th>
            <th>Email</th>
            <th>Mob No</th>
            <th>Department</th>
            <th>Course</th>
            <th>Year</th>
            <th>Semester</th>
            <th>Gender</th>
            
        </tr>
        <%
            try {
                StudentDAO dao = new StudentDAO();
                List<Student> students = dao.getAllStudents();

                if (students != null && !students.isEmpty()) {
                    for (Student s : students) {
        %>
        <tr>
            <td><%= s.getId() %></td>
            <td><%= s.getEnrollment() %></td>
            <td><%= s.getName() %></td>
            <td><%= s.getEmail() %></td>
            <td><%= s.getMob() %></td>
            <td><%= s.getDept() %></td>
            <td><%= s.getCourse() %></td>
            <td><%= s.getYear() %></td>
            <td><%= s.getSemester() %></td>
            <td><%= s.getGender() %></td>
            
        </tr>
        <%
                    }
                } else {
        %>
        <tr>
            <td colspan="11"><em>No students registered yet.</em></td>
        </tr>
        <%
                }
            } catch (Exception e) {
        %>
        <tr>
            <td colspan="11" style="color: red;"><%= "Error loading students: " + e.getMessage() %></td>
        </tr>
        <%
            }
        %>
    </table>

    <!-- Add New Student Link 
    <div class="action-link">
        <a href="addStudent.jsp">➕ Add New Student</a>
    </div>
-->
      <div class="mt-3">
         <a href="dashboard_Admin.jsp" class="back-link">Back</a>
      </div>
</body>
</html>
