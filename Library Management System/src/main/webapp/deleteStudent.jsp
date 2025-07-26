<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
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
<title>Delete Student</title>

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
<link rel="stylesheet" href="headerDesign.css">
<script src="Header.js"></script>

<style>
    body {
        margin: 0;
        font-family: Arial, sans-serif;
        background-color: #f4f6f8;
    }

    .form-wrapper {
        display: flex;
        justify-content: center;
        align-items: center;
        min-height: 80vh;
    }

    form {
        background-color: #fff;
        padding: 30px 40px;
        border-radius: 8px;
        box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
        width: 320px;
    }

    h2 {
        margin-bottom: 20px;
        color: #333;
        text-align: center;
    }

    label {
        font-weight: bold;
        margin-bottom: 6px;
        display: block;
        color: #555;
    }

    input[type="text"] {
        width: 100%;
        padding: 10px;
        margin-bottom: 15px;
        border: 1px solid #ccc;
        border-radius: 4px;
        box-sizing: border-box;
    }

    input[type="submit"] {
        background-color: #007BFF;
        color: white;
        border: none;
        padding: 10px 15px;
        border-radius: 4px;
        cursor: pointer;
        width: 100%;
        font-weight: bold;
    }

    input[type="submit"]:hover {
        background-color: #0056b3;
    }

    .text-center {
        text-align: center;
        margin-top: 20px;
    }

    a {
        text-decoration: none;
        color: #007bff;
        font-weight: bold;
    }

    a:hover {
        text-decoration: underline;
    }
</style>
</head>
<body>

<!-- Header Section -->
<div class="header-container">
    <h1><i class="fas fa-book"></i> Library Management System</h1>
    <div class="menu-icon" onclick="openNav()">
        <i class="fas fa-bars"></i>
    </div>
</div>

<!-- Sidebar Navigation -->
        
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
    
    

<!-- Delete Student Form -->
<div class="form-wrapper">
    <form action="studentcontroller" method="post" onsubmit="return confirm('Are you sure you want to delete this student?');">
        <h2>Delete Student</h2>
        <label for="enrollment">Enrollment ID</label>
        <input type="text" name="enrollment" id="enrollment" placeholder="Enter Enrollment ID" required>

        <input type="submit" name="action" value="Delete" title="Delete this student">
        
        <div class="text-center">
            <a href="dashboard_Admin.jsp">← Back to Dashboard</a>
        </div>
    </form>
</div>

</body>
</html>
