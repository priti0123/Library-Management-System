<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%
    String username = (String) session.getAttribute("username");
    String role = (String) session.getAttribute("role");
    if (username == null || (!"admin".equals(role)  &&  !"user".equals(role))) {
        response.sendRedirect("index.jsp");
        return;
    }
%>


<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Dashboard</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">

    <style>
        body {
           font-family: 'Poppins', sans-serif;
           background-image: url("LibraryImage2.jpg");
           background-size: cover;
           background-position: center;
           margin: 0;
           padding: 0;
           overflow-x: hidden;
           position: relative;
           color: #333;
        }
        
          body::before {
        content: '';
        position: fixed;
        top: 0; left: 0;
        width: 100%; height: 100%;
        background: rgba(0, 0, 0, 0.5);
        z-index: -1;
    }
    .header {
        position: sticky;
        top: 0;
        display: flex;
        justify-content: space-between;
        align-items: center;
       background:linear-gradient(to right, rgb(64, 10, 74), lab(23.56% 56.11 -76.04));
        color: white;
        padding: 25px;
        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.3);
        z-index: 1000;
       
        
}

    .header-left h1,
    .header-center h2 
    .header-right{
       margin: 0;
       font-size: 30px;
       display: flex;
       align-items: center;
}

      .header i {
           margin-right: 10px;
      }

      .header-center {
            position: absolute;
            left: 50%;
           transform: translateX(-50%);
    }
    
        .container {
            display: flex;
            justify-content: center;
            margin: 40px auto;
            padding: 30px;
            background-color: white;
            border-radius: 8px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
            width: 90%;
            max-width: 600px;
        }

        ul {
            list-style: none;
            padding: 0;
            margin: 0;
            width: 100%;
        }

        li {
            margin: 20px 0;
        }

        a {
        
            display: flex;
            align-items: center;
            justify-content: center; /* Vertically center */
            text-decoration: none;
            background-color: #343a40;
            color: white;
            padding: 15px;
            border-radius: 8px;
            text-align: center;
            transition: all 0.3s ease-in-out;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            font-size:16px;
        }



        a i {
            margin-right: 10px;
            font-size: 1.5em; /* Adjust the size of the icons */
            
        }
        

        a:hover {
            background-color: #495057;
            transform: scale(1.05);
            box-shadow: 0 6px 12px rgba(0, 0, 0, 0.2);
            color: #f8f9fa; /* Change text color on hover */
        }

        @keyframes fadeInDown {
            from {
                opacity: 0;
                transform: translateY(-30px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }

        /* Media Queries for responsiveness */
        @media (max-width: 768px) {
            .container {
                padding: 20px;
                width: 90%;
            }

            ul {
                width: 100%;
            }

            a {
                font-size: 14px;
                padding: 12px;
            }

            h1 {
                font-size: 24px;
                padding: 15px;
            }

            footer {
                padding: 15px;
            }
        }

        footer {
            text-align: center;
            margin-top: 50px;
            padding: 20px;
            background-color: #343a40;
            color: white;
        }

        footer a {
            color: #f8f9fa;
            text-decoration: none;
        }

        footer a:hover {
            text-decoration: underline;
        }
        
        .main h3{
             text-align: center;
             margin-top: 40px;
             font-family: 'Dancing Script', cursive;
             font-size: 50px;
             color: white;
             animation: fadeInDown 1s ease-out;
           
             
        }
          .main h2{
             text-align: center;
             margin-top: 40px;
             font-family: 'Dancing Script', cursive;
             font-size: 40px;
             color: white;
             animation: fadeInDown 1s ease-out;
           
             
        }
        
        .main-content h2{
             margin-top: 40px;
             font-family: 'Dancing Script', cursive;
             font-size: 40px;
             color: white;
             animation: fadeInDown 1s ease-out;
             text-align:center;
         }
    </style>
</head>
<body>


    <!-- Header Section -->
  
 <div class="header">
    <div class="header-left">
        <h1><i class="fas fa-home"></i> Home</h1>
    </div>
    <div class="header-center">
        <h2><i class="fas fa-book"></i> Library Management System</h2>
    </div>
    
    <div class="header-right">
         <a href="LogoutServlet" class="btn btn-danger mt-3">Logout</a>
    </div>
    
</div>

<div class="main">
   <h2>Welcome, <%= username %>!</h2>
   <h3>Welcome to Online Library System</h3>   
</div>

    <!-- Main Container -->
    <div class="container">
    
    
         <% if ("admin".equalsIgnoreCase(role)) { %>
        <ul>
            <li><a href="searchBook.jsp"><i class="fas fa-search"></i>Search Book</a></li>
            <li><a href="addBook.jsp"><i class="fas fa-plus-circle"></i> Add Book</a></li>
            <li><a href="DeleteBook.jsp"><i class="fas fa-book-xmark"></i> Delete Book</a></li>
            <li><a href="viewBooks.jsp"><i class="fas fa-book"></i> View Books</a></li>
            <li><a href="addStudent.jsp"><i class="fas fa-user-plus"></i> Add Student</a></li>
            <li><a href="deleteStudent.jsp"><i class="fas fa-user-minus"></i> Delete Student Records </a></li>
            <li><a href="viewStudents.jsp"><i class="fas fa-users"></i> View Students</a></li>
            <li><a href="issueBook.jsp"><i class="fas fa-book-open"></i> Issue Book</a></li>
            <li><a href="returnBook.jsp"><i class="fas fa-undo-alt"></i> Return Book</a></li>
            <li><a href="issuedBooks.jsp"><i class="fas fa-history"></i> Issued Book History</a></li>
            <li><a href="searchTransaction.jsp"><i class="fas fa-search"></i>Fine Details</a>
        </ul>
         <% } else { %>
         
            <ul>
            <li><a href="searchBook.jsp"><i class="fas fa-search"></i>Search Book</a></li>
            <li><a href="addBook.jsp"><i class="fas fa-plus-circle"></i> Add Book</a></li>
            <li><a href="viewBooks.jsp"><i class="fas fa-book"></i> View Books</a></li>
            <li><a href="addStudent.jsp"><i class="fas fa-user-plus"></i> Add Student</a></li>
            <li><a href="issueBook.jsp"><i class="fas fa-book-open"></i> Issue Book</a></li>
            <li><a href="returnBook.jsp"><i class="fas fa-undo-alt"></i> Return Book</a></li>
            <li><a href="issuedBooks.jsp"><i class="fas fa-history"></i> Issued Book History</a></li>
        </ul>
        
          <% } %>
          
          
    </div>
    
    <div class="main-content">
    <h2><%= "admin".equalsIgnoreCase(role) ? "Admin Dashboard" : "User Dashboard" %></h2>
    </div>

    
    <!-- Footer Section -->
    <footer>
        <p>&copy; 2025 Library Management System. All Rights Reserved.</p>
    </footer>

</body>
</html>
