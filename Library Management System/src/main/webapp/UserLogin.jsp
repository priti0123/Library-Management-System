
<%
    String role = request.getParameter("role");
    if (role == null) role = "user";

%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
    
    <style>
        body {
            font-family: Arial, sans-serif;
            background: #f0f2f5;
           
            display: flex;
            flex-direction: column;
            align-items: center;
            height: 100vh;
            margin: 0;
        }

       
        form {
            background-color: #fff;
            padding: 30px 40px;
            border-radius: 8px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
            width: 100%;
            max-width: 350px;
            box-sizing: border-box;
            margin-top: 40px;
        }

        h2 {
            text-align: center;
            color: #333;
            margin-bottom: 20px;
        }

        label {
            display: block;
            margin-bottom: 8px;
            color: #333;
            font-weight: bold;
        }

        input[type="text"],
        input[type="password"] {
            width: 100%;
            padding: 10px;
            margin-bottom: 20px;
            border: 1px solid #ccc;
            border-radius: 4px;
            transition: border-color 0.3s, box-shadow 0.3s;
        }

        input[type="text"]:focus,
        input[type="password"]:focus {
            border-color: #007bff;
            box-shadow: 0 0 8px rgba(0, 123, 255, 0.2);
            outline: none;
        }

        input[type="submit"],
        input[type="reset"] {
            padding: 10px 20px;
            border: none;
            border-radius: 4px;
            margin-right: 10px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        input[type="submit"] {
            background-color: #007bff;
            color: white;
        }

        input[type="submit"]:hover {
            background-color: #0056b3;
        }

        input[type="reset"] {
            background-color: #6c757d;
            color: white;
        }

        input[type="reset"]:hover {
            background-color: #5a6268;
        }

        .signup-link,
        .forgot-pword {
            text-align: center;
            margin-top: 15px;
        }

        .signup-link a,
        .forgot-pword a {
            text-decoration: none;
            font-weight: bold;
        }

        .signup-link a {
            color: #007bff;
        }

        .signup-link a:hover {
            text-decoration: underline;
        }

        .forgot-pword a {
            color: #dc3545;
        }

        .forgot-pword a:hover {
            text-decoration: underline;
        }

        @media (max-width: 400px) {
            form {
                padding: 20px;
            }

            h1 {
                font-size: 28px;
                padding: 15px;
            }
        }
    </style>
</head>

<body>

   
    <form method="post" action="loginservlet">
        <input type="hidden" name="role" value="<%= role %>">
        <h2>User Login</h2>

        <label for="username">Username:</label>
        <input type="text" id="username" name="username" required>

        <label for="password">Password:</label>
        <input type="password" id="password" name="password" required>

        <input type="submit" value="Login">
        <input type="reset" value="Reset">

        <div class="signup-link">
            <p>Don't have an account? <a href="Registration.html">Sign up</a></p>
        </div>

        <div class="forgot-pword">
            <a href="forgotPassword.html">Forgot Password</a>
        </div>
    </form>
</body>
</html>