import java.sql.Connection;
import java.sql.DriverManager;

public class DatabaseConnection {
    public static void main(String[] args) {

        String url = "jdbc:mysql://localhost:3306/java_db";
        String user = "root";
        String password = "root";

        try {
            Connection con = DriverManager.getConnection(url, user, password);

            System.out.println("Connected Successfully!");

            con.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}

/**
 * To compile
 * javac -cp ".:mysql-connector-j.jar" DatabaseConnection.java
 * 
 * To run
 * java -cp ".:mysql-connector-j.jar" DatabaseConnection
 */