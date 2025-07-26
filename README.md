#  📚 Library Management System

A web-based Library Management System developed using Java, JSP, Servlets, JDBC, and Oracle Database. This project provides functionalities to manage books, users (students), and book issuance, aimed at helping libraries efficiently organize and track their operations.

## 🔧 Tech Stack

- **Java** – Core application logic
- **JSP (JavaServer Pages)** – Front-end view rendering
- **Servlets** – Handling HTTP requests and responses
- **JDBC** – Oracle database connectivity
- **Oracle DB** – Backend database for storing data
- **Apache Tomcat** – Web server for deploying the application
- **Eclipse IDE** – Development environment

---

## ✨ Features

- 📖 Add, update, delete book details
- 👤 Register and manage student accounts
- 🔄 Issue and return books
- 🔍 Search for books and students
- 📅 Track issue and return dates
- 📊 Simple dashboard for statistics (optional)

---

## 📁 Project Structure

LibraryManagementSystem/
│
├── src/
│ └── com.library.* # Servlet and utility packages
│
├── WebContent/
│ ├── index.jsp # Home/login page
│ ├── addBook.jsp # Add new book form
│ ├── issueBook.jsp # Issue book form
│ ├── returnBook.jsp # Return book form
│ ├── student.jsp # Student management
│ └── ... # Other JSPs
│
├── lib/
│ └── ojdbc11.jar # Oracle JDBC driver
│
├── .classpath
├── .project
└── README.md



---

## ⚙️ Setup Instructions

### 1️⃣ Prerequisites

- JDK 8 or higher  
- Eclipse IDE (EE edition recommended)  
- Apache Tomcat (v8.5 or later)  
- Oracle Database (11g or higher)  
- Oracle JDBC Driver (`ojdbc8.jar`)  

---

### 2️⃣ Database Setup

```sql
-- Create books table
CREATE TABLE books (
    book_id NUMBER PRIMARY KEY,
    title VARCHAR2(100),
    author VARCHAR2(100),
    available VARCHAR2(3) -- 'YES' or 'NO'
);

-- Create students table
CREATE TABLE students (
    student_id NUMBER PRIMARY KEY,
    name VARCHAR2(100),
    department VARCHAR2(50)
);

-- Create issued_books table
CREATE TABLE issued_books (
    issue_id NUMBER PRIMARY KEY,
    book_id NUMBER REFERENCES books(book_id),
    student_id NUMBER REFERENCES students(student_id),
    issue_date DATE,
    return_date DATE
);

