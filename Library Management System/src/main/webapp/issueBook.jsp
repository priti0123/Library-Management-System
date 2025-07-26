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
    <meta charset="UTF-8">
    <title>Issue Book</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
     <link rel="stylesheet" href="headerDesign.css">
     <script src="Header.js"></script>

    <style>
        * {
            box-sizing: border-box;
        }

        body {
             background-image: url("LibraryImage2.jpg");
             background-size: cover;
             background-position: center;
            font-family: Arial, sans-serif;
            display: flex;
            flex-direction: column;
            align-items: center;
        }

      
      
        form {
            background-color: #ffffff;
            padding: 30px 40px;
            margin-top: 10px;
            border-radius: 10px;
            box-shadow: 0 8px 16px rgba(0, 0, 0, 0.1);
            width: 100%;
            max-width: 400px;
        }

        h2 {
            text-align: center;
            margin-bottom: 25px;
            color: black;
            background-color:white;
            
        }

        label {
            display: block;
            margin-bottom: 8px;
            font-weight: bold;
            color: #555;
        }

        input[type="number"],
        input[type="date"] {
            width: 100%;
            padding: 10px;
            margin-bottom: 20px;
            border: 1px solid #ccc;
            border-radius: 4px;
        }

        input[type="submit"] {
            width: 100%;
            padding: 12px;
            background-color: #28a745;
            color: white;
            font-size: 16px;
            font-weight: bold;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }

        input[type="submit"]:hover {
            background-color: #218838;
        }

        .note {
            font-size: 0.9em;
            color: #777;
            margin-top: -15px;
            margin-bottom: 20px;
        }

        .home-link {
            display: block;
            margin-top: 15px;
            text-align: center;
            text-decoration: none;
            background-color: #007bff;
            color: white;
            padding: 10px;
            border-radius: 4px;
            font-weight: bold;
        }

        .home-link:hover {
            background-color: #0056b3;
        }

        @media (max-width: 768px) {
            form {
                padding: 20px;
                margin: 20px;
            }

            h1 {
                font-size: 24px;
                padding: 15px;
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
    
    
    <!-- Issue Book Form -->
    <form action="issuecontroller" method="post">
        <h2>Issue Book</h2>

        <label for="bookId">Book ID:</label>
        <input type="number" id="bookId" name="bookId" required min="1" placeholder="Enter the book ID">

        <label for="studentId">Student ID:</label>
        <input type="number" id="studentId" name="studentId" required min="1" placeholder="Enter the student ID">

        <label for="issuedate">Issue Date:</label>
        <input type="date" id="issuedate" name="issuedate" required>
        <div class="note">Format: yyyy-MM-dd (e.g., 2025-05-27)</div>

        <input type="submit" value="Issue Book">

        <!-- Home Page Link Styled as Button -->
        <a href="dashboard_Admin.jsp" class="home-link"><i class="fas fa-home"></i> Home Page</a>
    </form>

</body>
</html>
