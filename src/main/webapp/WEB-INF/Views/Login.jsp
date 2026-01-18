<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Admin Login</title>
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
            box-sizing: border-box;
            font-size: 14px;
        }

        .form-group input:focus {
            outline: none;
            border-color: #2f9e44;
            box-shadow: 0 0 0 2px rgba(47, 158, 68, 0.2);
        }

        .btn {
            width: 100%;
            padding: 12px;
            background: #2f9e44; /* Green color to match the search/login theme */
            color: white;
            border: none;
            border-radius: 6px;
            font-size: 16px;
            font-weight: 600;
            cursor: pointer;
            transition: background 0.3s;
        }

        .btn:hover {
            background: #2b8a3e;
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
            padding: 10px;
            margin-bottom: 15px;
            border-radius: 4px;
            font-size: 14px;
        }
        
        .msg-info { background: #e7f5ff; color: #1971c2; border: 1px solid #a5d8ff; }
        .msg-error { background: #fff5f5; color: #e03131; border: 1px solid #ffc9c9; }
    </style>
</head>
<body>

    <div class="card">
        <div class="form-header">
            <h2>Admin Login</h2>
            <p style="color: #777; font-size: 14px;">Please enter your credentials</p>
        </div>

        <% if(request.getAttribute("msg") != null) { 
            String msg = (String)request.getAttribute("msg");
            String msgClass = msg.contains("successfully") ? "msg-info" : "msg-error";
        %>
            <div class="msg <%= msgClass %>">${msg}</div>
        <% } %>

        <form action="login" method="post">
            <div class="form-group">
                <label for="username">Username</label>
                <input type="text" id="username" name="username" 
                       placeholder="Enter your username" required>
            </div>

            <div class="form-group">
                <label for="password">Password</label>
                <input type="password" id="password" name="password" 
                       placeholder="Enter your password" required>
            </div>

            <button type="submit" class="btn">Login</button>
        </form>

        <div class="header-links">
            <a href="create">Don't have an account? Create one</a>
        </div>
    </div>

</body>
</html>