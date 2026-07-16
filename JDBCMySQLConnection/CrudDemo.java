import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class CrudDemo {
    private static final String URL = "jdbc:mysql://localhost:3306/java_db";
    private static final String USER = "root";
    private static final String PASSWORD = "root";

    public static void main(String[] args) {
        try (Connection connection = DriverManager.getConnection(URL, USER, PASSWORD)) {
            System.out.println("Connected to MySQL.");

            createTable(connection);
            insertStudent(connection, 1, "Amit", 20);
            readStudents(connection);
            updateStudent(connection, 1, "Amit Sharma", 21);
            readStudents(connection);
            deleteStudent(connection, 1);
            readStudents(connection);
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    private static void createTable(Connection connection) throws SQLException {
        String createTableSql = """
                CREATE TABLE IF NOT EXISTS students (
                    id INT PRIMARY KEY,
                    name VARCHAR(100) NOT NULL,
                    age INT NOT NULL
                )
                """;

        try (Statement statement = connection.createStatement()) {
            statement.execute(createTableSql);
            System.out.println("Table checked/created successfully.");
        }
    }

    private static void insertStudent(Connection connection, int id, String name, int age) throws SQLException {
        String insertSql = "INSERT INTO students (id, name, age) VALUES (?, ?, ?)";

        try (PreparedStatement preparedStatement = connection.prepareStatement(insertSql)) {
            preparedStatement.setInt(1, id);
            preparedStatement.setString(2, name);
            preparedStatement.setInt(3, age);

            int rowsInserted = preparedStatement.executeUpdate();
            System.out.println("Inserted rows: " + rowsInserted);
        }
    }

    private static void readStudents(Connection connection) throws SQLException {
        String selectSql = "SELECT id, name, age FROM students";

        try (Statement statement = connection.createStatement();
                ResultSet resultSet = statement.executeQuery(selectSql)) {
            System.out.println("Current records in students table:");

            while (resultSet.next()) {
                int id = resultSet.getInt("id");
                String name = resultSet.getString("name");
                int age = resultSet.getInt("age");

                System.out.println(id + " | " + name + " | " + age);
            }
        }
    }

    private static void updateStudent(Connection connection, int id, String newName, int newAge) throws SQLException {
        String updateSql = "UPDATE students SET name = ?, age = ? WHERE id = ?";

        try (PreparedStatement preparedStatement = connection.prepareStatement(updateSql)) {
            preparedStatement.setString(1, newName);
            preparedStatement.setInt(2, newAge);
            preparedStatement.setInt(3, id);

            int rowsUpdated = preparedStatement.executeUpdate();
            System.out.println("Updated rows: " + rowsUpdated);
        }
    }

    private static void deleteStudent(Connection connection, int id) throws SQLException {
        String deleteSql = "DELETE FROM students WHERE id = ?";

        try (PreparedStatement preparedStatement = connection.prepareStatement(deleteSql)) {
            preparedStatement.setInt(1, id);

            int rowsDeleted = preparedStatement.executeUpdate();
            System.out.println("Deleted rows: " + rowsDeleted);
        }
    }
}

/**
 * Compile from the JDBCMySQLConnection folder:
 * javac -cp ".:mysql-connector-j.jar" CrudDemo.java
 *
 * Run from the JDBCMySQLConnection folder:
 * java -cp ".:mysql-connector-j.jar" CrudDemo
 */
