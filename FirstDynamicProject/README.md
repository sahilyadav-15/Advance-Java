# FirstDynamicProject

This is a complete JSP + Servlet + JDBC login application packaged as a Maven WAR project.

## What To Install

You already have:

- Java 21
- MySQL client

You still need:

- Maven 3.9+
- Apache Tomcat 10.1+
- MySQL Server 8+

## Ubuntu Install Commands

```bash
sudo apt update
sudo apt install maven mysql-server
```

Download Tomcat 10.1 from the official Apache Tomcat site and extract it anywhere convenient, for example:

```bash
tar -xzf apache-tomcat-10.1.x.tar.gz
```

## Project Structure

- `pom.xml` builds the project as a WAR file.
- `src/main/webapp/login.jsp` contains the login form.
- `src/main/java/com/niet/auth/LoginServlet.java` validates credentials using JDBC.
- `src/main/java/com/niet/auth/LogoutServlet.java` clears the session.
- `src/main/webapp/profile.jsp` welcomes the logged-in user using HTTP Session.
- `database/users.sql` creates the `NIET` database and sample user.

## Database Setup

Start MySQL, then run:

```bash
mysql -u root -p < database/users.sql
```

Sample login:

- Email: `student@n123.com`
- Password: `password123`

## JDBC Settings

The servlet currently uses:

- URL: `jdbc:mysql://localhost:3306/NIET`
- Username: `root`
- Password: `root`

If your MySQL password is different, update:

- `src/main/java/com/niet/auth/LoginServlet.java`

## Build The WAR

From the `FirstDynamicProject` folder:

```bash
mvn clean package
```

This generates:

```bash
target/FirstDynamicProject.war
```

## Deploy To Tomcat

Copy the WAR into Tomcat's `webapps` folder:

```bash
cp target/FirstDynamicProject.war /path/to/apache-tomcat-10.1.x/webapps/
```

Start Tomcat:

```bash
/path/to/apache-tomcat-10.1.x/bin/startup.sh
```

Open:

```text
http://localhost:8080/FirstDynamicProject/
```

## Application Flow

1. `login.jsp` shows the login form.
2. `LoginServlet` reads form values using `request.getParameter()`.
3. JDBC checks the `users` table in the `NIET` database.
4. On success, the email is saved in session and the user is redirected to `profile.jsp`.
5. On failure, an error message appears on the login page.
6. `LogoutServlet` destroys the session and returns to the login page.
