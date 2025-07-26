<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="dao.IssuedBookDAO, model.IssuedBook, java.util.*" %>

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
    <meta charset="UTF-8">
    <title>Issued Books</title>
     
     <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
      <link rel="stylesheet" href="headerDesign.css">
     <script src="Header.js"></script>
     
    <style>
        body {
           background: #f8f9fa;
            font-family: Arial, sans-serif;
           background-color: #f8d7da;
        }

        h2 {
            text-align: center;
            color: white;
        }

        table {
            margin: 0 auto;
            border-collapse: collapse;
            width: 80%;
            background-color: #fff;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
        }

        th, td {
            padding: 12px 15px;
            border: 1px solid #ddd;
            text-align: center;
        }

        th {
            background-color: #007bff;
            color: white;
        }

        tr:nth-child(even) {
            background-color: #f9f9f9;
        }

        tr:hover {
            background-color: #f1f1f1;
        }

        .back-link {
            text-align: center;
            margin-top: 20px;
        }

        .back-link a {
            text-decoration: none;
            color: #007bff;
        }

        .back-link a:hover {
            text-decoration: underline;
        }
        
         h1 {
                font-size: 24px;
                padding: 15px;
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
    
    
    <h2>Issued Book History</h2>
    <table>
        <tr>
            <th>ID</th>
            <th>Book ID</th>
            <th>Student ID</th>
            <th>Issue Date</th>
            <th>Return Date</th>
        </tr>

        <%
            IssuedBookDAO dao = new IssuedBookDAO();
            List<IssuedBook> list = dao.getIssuedBooks();
            for (IssuedBook ib : list) {
        %>
        <tr>
            <td><%= ib.getId() %></td>
            <td><%= ib.getBookId() %></td>
            <td><%= ib.getStudentId() %></td>
            <td><%= ib.getIssueDate() %></td>
            <td><%= ib.getReturnDate() != null ? ib.getReturnDate() : "Not Returned" %></td>
        </tr>
        <% } %>
    </table>

    <div class="back-link">
        <p><a href="dashboard_Admin.jsp">← Back to Home</a></p>
    </div>

</body>
</html>
