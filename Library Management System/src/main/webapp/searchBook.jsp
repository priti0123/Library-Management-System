<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

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
    <title>Search Book</title>
    
    <!-- Font Awesome for Icons -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
     <link rel="stylesheet" href="headerDesign.css">
     <script src="Header.js"></script>
     
    <style>
    
        body {        
            font-family: Arial, sans-serif;
            background: #f3f3f3;
             background-color: #f8d7da;
        }

        h2 {
            color: white;
            text-align: center;
           
        }

        form {
            max-width: 400px;
            margin: 0 auto;
            background: #fff;
            padding: 25px;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
        }

        input[type="text"], select {
            width: 100%;
            padding: 10px;
            margin: 10px 0;
            border-radius: 6px;
            border: 1px solid #ccc;
        }

        input[type="submit"] {
            background-color: #007bff;
            color: white;
            border: none;
            padding: 12px;
            cursor: pointer;
            border-radius: 6px;
            width: 100%;
        }

        input[type="submit"]:hover {
            background-color: #0056b3;
        }
        
      
        /* Styling for the "Back" link */
        .back-link {
            text-decoration: none;
            color: #007bff;
            font-size: 1.1em;
            margin-top: 20px;
            display: inline-block;
        }

        .back-link:hover {
            text-decoration: underline;
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


    <h2>Search for a Book</h2>

    <form action="searchbookcontroller" method="post">
        <label for="query">Search by Title / Author / Name:</label>
        <input type="text" name="query" id="query" placeholder="Enter keyword..." required>

        <input type="submit" value="Search">
        <div class="mt-3">
        <a href="dashboard_Admin.jsp" class="back-link">Back</a>
    </div>
    </form>

    

</body>
</html>
