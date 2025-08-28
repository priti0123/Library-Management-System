<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
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
   
    <title>Transaction Results</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
    <link rel="stylesheet" href="headerDesign.css">
    
    <style>
        table {
            width: 80%;
            margin: 20px auto;
            border-collapse: collapse;
        }
        th, td {
            border: 1px solid #ccc;
            padding: 10px;
            text-align: center;
        }
        th {
            background: #007BFF;
            color: white;
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
    
    
    <h2 style="text-align:center;">Transaction Search Results</h2>
   

<%
    List<Map<String, Object>> transactions = (List<Map<String, Object>>) request.getAttribute("transactions");
%>

<table>
    <tr>
        <th>ID</th>
        <th>Student ID</th>
        <th>Book ID</th>
        <th>Issue ID</th>
        <th>Amount</th>
        <th>Date</th>
        <th>Description</th>
    </tr>

    <%
        if (transactions != null && !transactions.isEmpty()) {
            for (Map<String, Object> txn : transactions) {
    %>
    <tr>
        <td><%= txn.get("transaction_id") %></td>
        <td><%= txn.get("student_id") %></td>
        <td><%= txn.get("book_id") %></td>
        <td><%= txn.get("issue_id") %></td>
        <td>₹<%= txn.get("amount") %></td>
        <td><%= txn.get("transaction_date") %></td>
        <td><%= txn.get("description") %></td>
    </tr>
    <%
            }
        } else {
    %>
    <tr><td colspan="7">No records found.</td></tr>
    <%
        }
    %>
</table>

</body>
</html>
