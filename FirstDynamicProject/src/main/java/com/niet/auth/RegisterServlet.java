package com.niet.auth;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/register")
public class RegisterServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    private static final String JDBC_URL = "jdbc:mysql://localhost:3306/NIET";
    private static final String JDBC_USER = "root";
    private static final String JDBC_PASSWORD = "root";
    private static final String INSERT_USER_SQL =
            "INSERT INTO users (name, email, password, gender, city) VALUES (?, ?, ?, ?, ?)";

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.sendRedirect(request.getContextPath() + "/register.jsp");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String gender = request.getParameter("gender");
        String city = request.getParameter("city");

        if (isBlank(name) || isBlank(email) || isBlank(password) || isBlank(gender) || isBlank(city)) {
            request.setAttribute("errorMessage", "All fields are required.");
            request.getRequestDispatcher("/register.jsp").forward(request, response);
            return;
        }

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            registerUser(name.trim(), email.trim(), password.trim(), gender.trim(), city.trim());
            request.setAttribute("successMessage", "You have registered successfully.");
            request.getRequestDispatcher("/register.jsp").forward(request, response);
        } catch (ClassNotFoundException e) {
            throw new ServletException("MySQL JDBC Driver not found.", e);
        } catch (SQLException e) {
            request.setAttribute("errorMessage", "Registration failed. Email may already exist.");
            request.getRequestDispatcher("/register.jsp").forward(request, response);
        }
    }

    private void registerUser(String name, String email, String password, String gender, String city)
            throws SQLException {
        try (Connection connection = DriverManager.getConnection(JDBC_URL, JDBC_USER, JDBC_PASSWORD);
                PreparedStatement statement = connection.prepareStatement(INSERT_USER_SQL)) {
            statement.setString(1, name);
            statement.setString(2, email);
            statement.setString(3, password);
            statement.setString(4, gender);
            statement.setString(5, city);
            statement.executeUpdate();
        }
    }

    private boolean isBlank(String value) {
        return value == null || value.trim().isEmpty();
    }
}
