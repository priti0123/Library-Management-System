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
    <title>Return Book</title>
    <!-- Include Font Awesome for icons -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
     <link rel="stylesheet" href="headerDesign.css">
     <script src="Header.js"></script>
     
    <style>
    
        body {
            font-family: Arial, sans-serif;
            background: #f4f6f8;
            background-image: url("LibraryImage2.jpg");
           background-size: cover;
           background-position: center;
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            
        }
        
         h2 {
            text-align: center;
            background-color: white;
            margin-bottom: 20px;
            font-size: 24px;
            color:black;
        }
        
      .back-link {
            display: inline-block;
            margin-top: 15px;
            margin-left:15px;
        }
        /* Full-width header style */
      

        /* Styling the form */
        form {
            background-color: #fff;
            padding: 30px 40px;
            border-radius: 8px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
            width: 320px;
            margin-top: 20px;
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

        input[type="number"],
        input[type="date"] {
            width: 100%;
            padding: 10px;
            margin-bottom: 15px;
            border: 1px solid #ccc;
            border-radius: 4px;
            box-sizing: border-box;
        }

        .note {
            font-size: 0.9em;
            color: #666;
            margin-top: -10px;
            margin-bottom: 15px;
        }

        input[type="submit"] {
            background-color: #28a745;
            color: white;
            border: none;
            padding: 10px 15px;
            border-radius: 4px;
            cursor: pointer;
            width: 100%;
            font-weight: bold;
        }

        input[type="submit"]:hover {
            background-color: #218838;
        }

      a {
            margin-top: 0px;
            text-decoration: none;
            color:#007bff;
            font-size: 0.96em;
            font-weight:bold;
            text-align:center;
        }

        #viewbook{
          margin-top: 20px;
          text-align:center;
          text-decoration: none;
          color:#007bff;
          font-size: 0.96em;
          font-weight:bold;
          text-align:center;
        }



        a:hover {
            text-decoration: underline;
        }

        /* Animation for header fadeIn */
        @keyframes fadeInDown {
            from {
                opacity: 0;
                transform: translateY(-20px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
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

  <!-- Form to return a book -->
  <form action="returncontroller" method="post">
    <h2>Return a Book</h2>

    <label for="bookId">Book ID:</label>
    <input type="number" name="bookId" id="bookId" required min="1" />

    <label for="returndate">Return Date:</label>
    <input type="date" name="returndate" id="returndate" required />
    <div class="note">Format: yyyy-MM-dd (e.g., 2025-05-27)</div>

    <input type="submit" value="Return Book" />
    
     <div id="viewtransaction">
      <a href="transactionResult.jsp">View Transaction Details</a>
    
     <div id="viewbook">
      <a href="viewBooks.jsp">View All Books</a>
    </div> 
    
  </form>

  <!-- Link to view all books -->

</body>
</html>
