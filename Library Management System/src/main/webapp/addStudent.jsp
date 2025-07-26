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
    <title>Add Student</title>

    <!-- Bootstrap & Font Awesome -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
     <link rel="stylesheet" href="headerDesign.css">
     <script src="Header.js"></script>

    <style>
    
        body{
            background-image: url("LibraryImage2.jpg");
            }
          
            
          h2{
              padding:10px;
          }
          .container {
            margin-top: 40px; /* Prevent overlap with header */
            max-width: 700px;
            background-color: white;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 8px 16px rgba(0, 0, 0, 0.2);
        }

        .card-header {
            background-color: #4CAF50 !important;
            color: white;
            font-weight: bold;
            font-size: 10px;
            text-align: center;
        }

        .form-group label {
            font-weight: 600;
        }

        .btn {
            min-width: 120px;
        }

        .back-link {
            display: inline-block;
            margin-top: 15px;
            text-decoration: none;
            color: #007BFF;
        }

        .back-link:hover {
            text-decoration: underline;
        }

        @media (max-width: 768px) {
            .container {
                margin: 120px 15px 30px;
            }
        }
    </style>
</head>
<body class="bg-light">


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

   

    <div class="container">
        <div class="card">
            <div class="card-header">
                <h2 class="mb-0">Add Student</h2>
            </div>
            <div class="card-body">
                <form action="studentcontroller" method="post" >
                
                 <input type="hidden" name="action" value="add" />
                    <div class="form-group">
                        <label for="name">Name:</label>
                        <input type="text" id="name" name="name" class="form-control" required>
                    </div>

                    <div class="form-group">
                        <label for="id">Enrollment No:</label>
                        <input type="text" id="id" name="enrollment" class="form-control" required>
                    </div>

                    <div class="form-group">
                        <label for="course">Course:</label>
                        <input type="text" id="course" name="course" class="form-control" required>
                    </div>

                    <div class="form-group">
                        <label for="department">Department:</label>
                        <input type="text" id="department" name="department" class="form-control" required>
                    </div>

                    <div class="form-row">
                        <div class="form-group col-md-6">
                            <label for="year">Year:</label>
                            <input type="number" id="year" name="year" class="form-control" required min="1" max="5">
                        </div>

                        <div class="form-group col-md-6">
                            <label for="semester">Semester:</label>
                            <input type="number" id="semester" name="semester" class="form-control" required min="1" max="12">
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="email">Email:</label>
                        <input type="email" id="email" name="email" class="form-control" required>
                    </div>

                    <div class="form-group">
                        <label for="mob">Mobile No:</label>
                        <input type="tel" id="mob" name="mob" class="form-control" required pattern="[0-9]{10}" placeholder="10-digit mobile number">
                    </div>

                    <div class="form-group">
                        <label for="gender">Gender:</label>
                        <select id="gender" name="gender" class="form-control" required>
                            <option value="">--Select--</option>
                            <option value="Male">Male</option>
                            <option value="Female">Female</option>
                            <option value="Other">Other</option>
                        </select>
                    </div>

                    <button type="submit" class="btn btn-success">Add Student</button>
                    <button type="reset" class="btn btn-secondary">Clear</button>
                </form>

                <div class="mt-3">
                    <a href="dashboard_Admin.jsp" class="back-link">Back</a>
                </div>
            </div>
        </div>
    </div>


</body>
</html>
