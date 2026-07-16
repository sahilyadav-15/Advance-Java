<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Register</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f7fb;
            margin: 0;
            padding: 40px 16px;
        }

        .register-box {
            width: 400px;
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

        input[type="text"],
        input[type="email"],
        input[type="password"],
        select {
            width: 100%;
            padding: 10px;
            margin-bottom: 14px;
            border: 1px solid #c9d2dc;
            border-radius: 6px;
            box-sizing: border-box;
        }

        .radio-group {
            display: flex;
            gap: 14px;
            margin-bottom: 14px;
        }

        .radio-group label {
            font-weight: normal;
            margin-bottom: 0;
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

        .message {
            color: #2e7d32;
            margin-bottom: 14px;
            text-align: center;
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
    <div class="register-box">
        <h2>User Registration</h2>

        <%
            String successMessage = (String) request.getAttribute("successMessage");
            String errorMessage = (String) request.getAttribute("errorMessage");
            if (successMessage != null) {
        %>
            <div class="message"><%= successMessage %></div>
        <%
            }
            if (errorMessage != null) {
        %>
            <div class="error"><%= errorMessage %></div>
        <%
            }
        %>

        <form action="<%= request.getContextPath() %>/register" method="post">
            <label for="name">Name</label>
            <input type="text" id="name" name="name" placeholder="Enter your name" required>

            <label for="email">Email</label>
            <input type="email" id="email" name="email" placeholder="Enter your email" required>

            <label for="password">Password</label>
            <input type="password" id="password" name="password" placeholder="Enter your password" required>

            <label>Gender</label>
            <div class="radio-group">
                <label><input type="radio" name="gender" value="Male" required> Male</label>
                <label><input type="radio" name="gender" value="Female"> Female</label>
                <label><input type="radio" name="gender" value="Other"> Other</label>
            </div>

            <label for="city">City</label>
            <select id="city" name="city" required>
                <option value="">Select your city</option>
                <option value="Noida">Noida</option>
                <option value="Delhi">Delhi</option>
                <option value="Lucknow">Lucknow</option>
                <option value="Mumbai">Mumbai</option>
                <option value="Other">Other</option>
            </select>

            <button type="submit">Register</button>
        </form>

        <div class="link-row">
            <a href="<%= request.getContextPath() %>/login.jsp">Already registered? Login</a>
        </div>
    </div>
</body>
</html>
