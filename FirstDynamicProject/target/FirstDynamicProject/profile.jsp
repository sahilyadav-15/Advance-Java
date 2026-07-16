<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%
    String userEmail = (String) session.getAttribute("userEmail");
    if (userEmail == null) {
        response.sendRedirect(request.getContextPath() + "/login.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Profile</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #eef3f8;
            margin: 0;
            padding: 40px 16px;
        }

        .profile-box {
            max-width: 520px;
            margin: 0 auto;
            background: #ffffff;
            padding: 28px;
            border-radius: 10px;
            box-shadow: 0 8px 20px rgba(0, 0, 0, 0.12);
            text-align: center;
        }

        a {
            display: inline-block;
            margin-top: 16px;
            color: #1565c0;
            text-decoration: none;
            font-weight: bold;
        }
    </style>
</head>
<body>
    <div class="profile-box">
        <h1>Welcome, <%= userEmail %>!</h1>
        <p>Login successful. Your session is active.</p>
        <a href="<%= request.getContextPath() %>/logout">Logout</a>
    </div>
</body>
</html>
