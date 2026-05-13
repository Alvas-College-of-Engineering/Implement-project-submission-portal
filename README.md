# Project Submission Portal (Java Web)

## Description
A Java EE 8 web application for managing student project submissions.  
Built with **Servlets**, **JSP**, **JSTL**, and **Maven**, deployed on **Apache Tomcat 9**.

---

## Easiest Way to Run

**Just double-click `run.bat`** inside the project folder.

```
C:\Users\kavyk\Downloads\p\Project-Submission-Portal-Java-main\run.bat
```

It will build, deploy, start Tomcat, and open the browser automatically.

---

## Run Manually via CMD (copy-paste these exactly)

Open **Command Prompt (CMD)** and run these commands one by one:

### Step 1 — Build the WAR

```cmd
C:\maven\apache-maven-3.9.15\bin\mvn.cmd clean package -f "C:\Users\kavyk\Downloads\p\Project-Submission-Portal-Java-main\pom.xml"
```

### Step 2 — Deploy to Tomcat

```cmd
copy /y "C:\Users\kavyk\Downloads\p\Project-Submission-Portal-Java-main\target\project-submission-portal.war" "C:\apache-tomcat-9.0.117-windows-x64\apache-tomcat-9.0.117\webapps\"
```

### Step 3 — Start Tomcat

Run these **one by one**:

```cmd
set JAVA_HOME=C:\Program Files\Java\jdk-25
```

```cmd
set CATALINA_HOME=C:\apache-tomcat-9.0.117-windows-x64\apache-tomcat-9.0.117
```

```cmd
C:\apache-tomcat-9.0.117-windows-x64\apache-tomcat-9.0.117\bin\startup.bat
```

### Step 4 — Open in Browser

```
http://localhost:8080/project-submission-portal/
```

Wait about 5–10 seconds after Step 3 before opening the browser.

---

## Stop the Server

```cmd
C:\apache-tomcat-9.0.117-windows-x64\apache-tomcat-9.0.117\bin\shutdown.bat
```

---

## App Pages

| Page           | URL                                                        |
|----------------|------------------------------------------------------------|
| Home           | http://localhost:8080/project-submission-portal/           |
| Submit Project | http://localhost:8080/project-submission-portal/submitProject |
| View Projects  | http://localhost:8080/project-submission-portal/viewProjects  |
| Update Status  | http://localhost:8080/project-submission-portal/updateStatus  |

---

## Features
- Submit a new student project via a web form
- View all submitted projects in a table with colour-coded status badges
- Update the review status of any project (Submitted / Under Review / Approved / Rejected)
- Input validation with error and success messages
- Custom 404 / 500 error pages

---

## Tech Stack

| Layer    | Technology                        |
|----------|-----------------------------------|
| Build    | Maven 3.9 (WAR packaging)         |
| Language | Java 25                           |
| Backend  | Java EE 8 — javax.servlet 4.0.1   |
| Views    | JSP 2.3 + JSTL 1.2                |
| Config   | web.xml (Servlet 4.0)             |
| Server   | Apache Tomcat 9.x                 |

---

## Project Structure

```
Project-Submission-Portal-Java-main/
├── run.bat                              ← double-click to run
├── pom.xml                              ← Maven build file
└── src/main/
    ├── java/
    │   ├── listener/AppContextListener.java
    │   ├── model/Project.java
    │   ├── service/Portal.java
    │   └── servlet/
    │       ├── SubmitProjectServlet.java
    │       ├── ViewProjectsServlet.java
    │       └── UpdateStatusServlet.java
    └── webapp/
        ├── index.jsp
        └── WEB-INF/
            ├── web.xml
            └── views/
                ├── submit.jsp
                ├── view.jsp
                ├── update.jsp
                └── error.jsp
```

---

## Notes
- Data is stored **in-memory** — resets when Tomcat restarts.
- `mvn` alone won't work in CMD because Maven is not in the system PATH. Always use the full path: `C:\maven\apache-maven-3.9.15\bin\mvn.cmd`
