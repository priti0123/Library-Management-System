<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Registration Success</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-image: url("LibraryImage2.jpg");
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
        }

        .container {
            text-align: center;
            background-color: #fff;
            padding: 40px 50px;
            border-radius: 10px;
            box-shadow: 0 10px 25px rgba(0, 0, 0, 0.1);
        }

        h2 {
            color: #2d6a4f;
            margin-bottom: 20px;
        }

        a {
            display: inline-block;
            margin-top: 15px;
            text-decoration: none;
            background-color: #007bff;
            color: white;
            padding: 12px 24px;
            border-radius: 6px;
            transition: background-color 0.3s ease, transform 0.2s ease;
        }

        a:hover {
            background-color: #0056b3;
            transform: translateY(-2px);
        }
    </style>
</head>
<body>
    <div class="container">
        <h2>You have registered successfully!</h2>
        <h2>Now you can log in.</h2>
        <a href="UserLogin.jsp">Login</a>
    </div>
</body>
</html>
