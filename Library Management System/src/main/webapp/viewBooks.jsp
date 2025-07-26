<%@ page import="java.util.*, dao.BookDAO, model.Book" %>
<%
    BookDAO dao = new BookDAO();
    List<Book> books = null;
    try {
        books = dao.getAllBooks();
    } catch (Exception e) {
        e.printStackTrace(); // Optional: log to a file or display a friendly message
        books = new ArrayList<>();
    }
    
    
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
    <title>All Books</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
    <link rel="stylesheet" href="headerDesign.css">
    
    <style>
        body {
            font-family: 'Poppins', sans-serif;
           background-image: url("LibraryImage2.jpg");
           background-size: cover;
           background-position: center;
           background-color: #f2f2f2;
        }

      

        table {
            width: 90%;
            margin: 30px auto;
            border-collapse: collapse;
            background-color: white;
            box-shadow: 0 4px 8px rgba(0,0,0,0.1);
        }

        th, td {
            border: 1px solid #ddd;
            padding: 12px;
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
            transition: all 0.2s ease-in-out;
        }

        form {
            display: inline;
        }

        input[type="submit"] {
            background-color: #e74c3c;
            color: white;
            border: none;
            padding: 8px 12px;
            border-radius: 4px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        input[type="submit"]:hover {
            background-color: #c0392b;
        }

        .back-link {
            text-align: center;
            margin-top: 20px;
        }

        .back-link a {
            background-color: #007bff;
            color: white;
            padding: 10px 20px;
            border-radius: 5px;
            text-decoration: none;
            transition: background-color 0.3s ease;
        }

        .back-link a:hover {
            background-color: #0056b3;
        }

        @media (max-width: 768px) {
            table, th, td {
                font-size: 14px;
            }

            input[type="submit"] {
                padding: 6px 10px;
            }

            h1 {
                font-size: 20px;
                padding: 15px;
            }
        }
        
      
    </style>
    
    <script>
        // Open the sidebar
        function openNav() {
            document.getElementById("mySidebar").style.width = "250px";
        }

        // Close the sidebar
        function closeNav() {
            document.getElementById("mySidebar").style.width = "0";
        }
    </script>
</head>

<body>

    <!-- Header Section -->
    <div class="header-container">
        <h1><i class="fas fa-books"></i> Library Management System</h1>
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

    <h2>Book List</h2>

    <table>
        <tr>
            <th>ID</th>
            <th>Title</th>
            <th>Author</th>
            <th>Status</th>
            <th>Book Name</th>
           
        </tr>
        <%
            if (books != null && !books.isEmpty()) {
                for (Book b : books) {
        %>
        <tr>
            <td><%= b.getId() %></td>
            <td><%= b.getTitle() %></td>
            <td><%= b.getAuthor() %></td>
            <td><%= b.isIssued() ? "Issued" : "Available" %></td>
            <td><%= b.getName() %></td>
           
        </tr>
        <%
                }
            } else {
        %>
        <tr>
            <td colspan="6">No books available.</td>
        </tr>
        <%
            }
        %>
    </table>

   
      
    <div class="back-link">
        <a href="dashboard_Admin.jsp"> Back to Home</a>
    </div>

</body>
</html>
