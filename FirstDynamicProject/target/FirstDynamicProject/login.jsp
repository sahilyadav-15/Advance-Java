<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Login</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f7fb;
            margin: 0;
            padding: 40px 16px;
        }

        .login-box {
            width: 360px;
            margin: 0 auto;
            background: #ffffff;
            padding: 24px;
            border-radius: 10px;
            box-shadow: 0 8px 20px rgba(0, 0, 0, 0.12);
        }

        h2 {
            text-align: center;
            margin-bottom: 20px;
        }

        label {
            display: block;
            margin-bottom: 6px;
            font-weight: bold;
        }

        input[type="email"],
        input[type="password"] {
            width: 100%;
            padding: 10px;
            margin-bottom: 14px;
            border: 1px solid #c9d2dc;
            border-radius: 6px;
            box-sizing: border-box;
        }

        button {
            width: 100%;
            padding: 10px;
            border: none;
            border-radius: 6px;
            background-color: #1565c0;
            color: #ffffff;
            font-size: 16px;
            cursor: pointer;
        }

        .error {
            color: #c62828;
            margin-bottom: 14px;
            text-align: center;
        }

        .link-row {
            margin-top: 16px;
            text-align: center;
        }

        .link-row a {
            color: #1565c0;
            text-decoration: none;
            font-weight: bold;
        }
    </style>
</head>
<body>
    <div class="login-box">
        <h2>User Login</h2>

        <%
            String errorMessage = (String) request.getAttribute("errorMessage");
            if (errorMessage != null) {
        %>
            <div class="error"><%= errorMessage %></div>
        <%
            }
        %>

        <form action="<%= request.getContextPath() %>/login" method="post">
            <label for="email">Email</label>
            <input type="email" id="email" name="email" placeholder="Enter your email" required>

            <label for="password">Password</label>
            <input type="password" id="password" name="password" placeholder="Enter your password" required>

            <button type="submit">Login</button>
        </form>

        <div class="link-row">
            <a href="<%= request.getContextPath() %>/register.jsp">Create a new account</a>
        </div>
    </div>
</body>
</html>
