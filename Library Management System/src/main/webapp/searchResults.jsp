<%@ page import="java.util.*, model.Book" %>
<%@ page contentType="text/html;charset=UTF-8" %>

<%
    String username = (String) session.getAttribute("username");
    String role = (String) session.getAttribute("role");
    if (username == null ) {
        response.sendRedirect("index.html");
        return;
    }
%>
<html>
<head>
    <title>Search Results</title>
    
     <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
      <link rel="stylesheet" href="headerDesign.css">
     <script src="Header.js"></script>
    
     
    <style>
          body{
           background-color: #f8d7da;
           }
      
        table {
            width: 80%;
            margin: auto;
            border-collapse: collapse;
            margin-top: 30px;
        }

        th, td {
            padding: 10px;
            border: 1px solid #bbb;
            text-align: center;
        }

        th {
            background-color: #007bff;
            color: white;
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

   

<h2 style="text-align:center;">Search Results</h2>

<%
    List<Book> books = (List<Book>) request.getAttribute("books");
    if (books == null || books.isEmpty()) {
%>
    <p style="text-align:center;">No books found for your search.</p>
<%
    } else {
%>
    <table>
        <tr>
            <th>ID</th>
            <th>Title</th>
            <th>Author</th>
            <th>Name</th>
            <th>Is Available</th>
        </tr>
        <%
            for (Book book : books) {
        %>
        <tr>
            <td><%= book.getId() %></td>
            <td><%= book.getTitle() %></td>
            <td><%= book.getAuthor() %></td>
            <td><%= book.getName() %></td>
            <td><%= book.isIssued() ? "Not Available" : "Available"%></td>
           
        </tr>
        <% } %>
    </table>
<% } %>
  <div class="back-link">
        <p><a href="searchBook.jsp">← Back to Search </a></p>
    </div>
</body>
</html>
