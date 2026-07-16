# FirstDynamicProject

This is a JSP + Servlet + JDBC web application packaged as a Maven WAR project. It includes both user registration and login.

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
- `src/main/webapp/register.jsp` contains the registration form.
- `src/main/java/com/niet/auth/LoginServlet.java` validates credentials using JDBC.
- `src/main/java/com/niet/auth/RegisterServlet.java` inserts a new user into MySQL using JDBC.
- `src/main/java/com/niet/auth/LogoutServlet.java` clears the session.
- `src/main/webapp/profile.jsp` welcomes the logged-in user using HTTP Session.
- `database/users.sql` creates the `NIET` database and the `users` table with registration fields.

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
- `src/main/java/com/niet/auth/RegisterServlet.java`

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

You can access the pages directly at:

```text
Login page:    http://localhost:8080/FirstDynamicProject/login.jsp
Register page: http://localhost:8080/FirstDynamicProject/register.jsp
```

You can also open the register servlet path directly:

```text
http://localhost:8080/FirstDynamicProject/register
```

## Application Flow

1. `register.jsp` collects name, email, password, gender, and city.
2. `RegisterServlet` reads form values using `request.getParameter()` and inserts them into the `users` table.
3. On successful registration, the page displays: `You have registered successfully.`
4. `login.jsp` allows an existing user to sign in.
5. `LoginServlet` validates credentials using JDBC.
6. On success, the email is saved in session and the user is redirected to `profile.jsp`.
7. `LogoutServlet` destroys the session and returns to the login page.
