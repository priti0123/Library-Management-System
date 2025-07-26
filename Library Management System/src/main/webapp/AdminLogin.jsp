<%@ page contentType="text/html;charset=UTF-8" %>
<%
    String role = request.getParameter("role");
    if (role == null) role = "user";
%>
<!DOCTYPE html>
<html>
<head>
    <title><%= role.substring(0, 1).toUpperCase() + role.substring(1) %> Login</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" />
</head>
<body>
<div class="container mt-5" style="max-width: 400px;">
    <h3 class="text-center mb-4"><%= role.equals("admin") ? "Admin" : "Student" %> Login</h3>

    <% if ("1".equals(request.getParameter("error"))) { %>
        <div class="alert alert-danger">Invalid username or password</div>
    <% } %>

    <form method="post" action="loginservlet">
        <input type="hidden" name="role" value="<%= role %>">
        <div class="mb-3">
            <label>Username</label>
            <input type="text" name="username" class="form-control" required />
        </div>
        <div class="mb-3">
            <label>Password</label>
            <input type="password" name="password" class="form-control" required />
        </div>
        <button type="submit" class="btn btn-primary w-100">Login</button>
        <div class="mt-3 text-center">
            <a href="index.jsp">← Back to Home</a>
        </div>
    </form>
</div>
</body>
</html>
