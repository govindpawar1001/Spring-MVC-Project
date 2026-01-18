<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Create Admin Account</title>
    <style>
        body {
            margin: 0;
            font-family: "Segoe UI", Tahoma, Geneva, Verdana, sans-serif;
            background: #f2f4f7;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }

        .card {
            background: white;
            padding: 40px;
            border-radius: 12px;
            box-shadow: 0 10px 25px rgba(0,0,0,0.1);
            width: 100%;
            max-width: 400px;
        }

        .form-header {
            text-align: center;
            margin-bottom: 30px;
        }

        .form-header h2 {
            color: #3f5870;
            margin: 0;
            font-size: 28px;
        }

        .form-group {
            margin-bottom: 20px;
        }

        .form-group label {
            display: block;
            margin-bottom: 8px;
            color: #555;
            font-weight: 600;
        }

        .form-group input {
            width: 100%;
            padding: 12px;
            border: 1px solid #ddd;
            border-radius: 6px;
            box-sizing: border-box; /* Crucial for padding */
            font-size: 14px;
        }

        .form-group input:focus {
            outline: none;
            border-color: #4c6ef5;
            box-shadow: 0 0 0 2px rgba(76, 110, 245, 0.2);
        }

        .btn {
            width: 100%;
            padding: 12px;
            background: #4c6ef5;
            color: white;
            border: none;
            border-radius: 6px;
            font-size: 16px;
            font-weight: 600;
            cursor: pointer;
            transition: background 0.3s;
        }

        .btn:hover {
            background: #3b5bdb;
        }

        .header-links {
            text-align: center;
            margin-top: 20px;
        }

        .header-links a {
            color: #4c6ef5;
            text-decoration: none;
            font-size: 14px;
        }

        .header-links a:hover {
            text-decoration: underline;
        }

        .msg {
            text-align: center;
            color: #e03131;
            margin-bottom: 15px;
            font-weight: bold;
        }
    </style>
</head>
<body>

    <div class="card">
        <div class="form-header">
            <h2>Create Admin</h2>
            <p style="color: #777; font-size: 14px;">Register a new administrator</p>
        </div>

        <% if(request.getAttribute("msg") != null) { %>
            <div class="msg">${msg}</div>
        <% } %>

        <form action="create" method="post">
            <div class="form-group">
                <label for="username">Username</label>
                <input type="text" id="username" name="username" 
                       placeholder="Choose a username" required>
            </div>

            <div class="form-group">
                <label for="password">Password</label>
                <input type="password" id="password" name="password" 
                       placeholder="Create a password" required>
            </div>

            <button type="submit" class="btn">Create Account</button>
            
        </form>

        <div class="header-links">
            <a href="login">Already have an account? Login</a>
        </div>
    </div>

</body>
</html>