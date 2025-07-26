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
    <title>Add Book</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
     <link rel="stylesheet" href="headerDesign.css">
     <script src="Header.js"></script>
    
    <style>
        body {
            font-family: 'Segoe UI', sans-serif;
            background-image: url("LibraryImage2.jpg");
            margin: 0;
            padding: 0;
        }

        .container {
            background-color: white;
            padding: 30px 40px;
            border-radius: 10px;
            box-shadow: 0 8px 20px rgba(0, 0, 0, 0.1);
            max-width: 400px;
            margin: 40px auto; /* Center horizontally with spacing from top */
            animation: slideIn 0.5s ease-in-out;
        }
        

        h2 {
            text-align: center;
            background-color: white;
            margin-bottom: 20px;
            font-size: 24px;
            color:black;
        }

        label {
            display: block;
            margin-bottom: 6px;
            color: #333;
            font-weight: 600;
        }

        input[type="text"] {
            width: 100%;
            padding: 12px;
            margin-bottom: 15px;
            border: 1px solid #ccc;
            border-radius: 5px;
            font-size: 16px;
            transition: border-color 0.3s ease;
        }

        input[type="text"]:focus {
            border-color: #4CAF50;
            outline: none;
        }

        input[type="submit"] {
            background-color: #4CAF50;
            color: white;
            border: none;
            padding: 12px;
            width: 100%;
            border-radius: 5px;
            font-size: 16px;
            font-weight: bold;
            cursor: pointer;
            transition: background-color 0.3s ease, transform 0.2s ease;
        }

        input[type="submit"]:hover {
            background-color: #45a049;
            transform: translateY(-2px);
        }

        a {
            display: block;
            text-align: center;
            margin-top: 20px;
            text-decoration: none;
            color: #007BFF;
            font-weight: bold;
            transition: color 0.3s ease;
        }

        a:hover {
            color: #0056b3;
        }

        @keyframes slideIn {
            from {
                opacity: 0;
                transform: translateY(-20px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }

        @media (max-width: 500px) {
            .container {
                padding: 20px;
            }

            h2 {
                font-size: 20px;
            }
        }
        h3{
          text-align:center;
          color:green;
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
   
    <!-- Centered Form -->
    
   
    <div class="container">
        <h2>Add New Book</h2>
        <form action="bookcontroller" method="post" id="addBookForm">
            <input type="hidden" name="action" value="add" />

            <label for="title">Title:</label>
            <input type="text" id="title" name="title" required minlength="3" />

            <label for="author">Author:</label>
            <input type="text" id="author" name="author" required minlength="3" />

            <label for="bookname">Book Name:</label>
            <input type="text" id="bookname" name="bookname" required minlength="3" />

            <input type="submit" value="Add Book" />
        </form>

        <div class="mt-3 text-center">
        <a href="dashboard_Admin.jsp">← Back to Dashboard</a>
       </div>
    </div>

</body>
</html>
