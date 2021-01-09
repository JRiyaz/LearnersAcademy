# LearnersAcademy

Learner’s Academy is an online management system of a school. It keeps a track of all the classes, subjects, students,
and teachers. Management can be done with a single administrator login.

# Frameworks and Technologies used

1. Maven
2. Java 1.8
3. JEE
4. JSP
5. JSTL
6. JDBC
7. PostgreSQL
8. Lombok
9. HTML
10. CSS
11. Javascript
12. jQuery
13. Bootstrap CSS and JS
14. XML
15. Git and Github
16. Agile Scrum Methodology

# Concepts and Algorithms used

1. File Handling - To handle file operations
2. Streams - To make the code easy to read, and it reduces no.of lines
3. Collections - To store and perform looping, searching, and sorting operations

# Database and Structure

In the project root directory I've added a database.png image, in that you will find out the structure of the database.
Also, I've provided LearnersAcademy.sql file which contains the database, table creation and data that required to run
the program as well.

NOTE:

1. I'm using PostgreSQL database and, I've designed the LearnersAcademy.sql file related to PostgreSQL database. Please
   make necessary changes if you are using different database.
2. I've a created config.properties file in (WebContent/WEB-INF/classes/config.properties) directory. It contains the
   database related configuration like driver, url, username and, password, please do make changes in that file as well
   as per user database.

# Website roadmap

1. learners-academy-1.1/ @Home page
2. learners-academy-1.1/home @Home page
3. learners-academy-1.1/login @Login page
4. learners-academy-1.1/classes @To view list of all classes
5. learners-academy-1.1/report?classId=1 (1 to 10)      @To view detailed report of a particular class
6. learners-academy-1.1/subjects - To view list of all subjects
7. learners-academy-1.1/teachers?page=1 (1 to 4)        @To view list of all teachers
8. learners-academy-1.1/teacher?teacherId=1 (1 to 40)   @To view the details of a particular teacher
9. learners-academy-1.1/students?page=1 (1 to 25)       @To view list of all students
10. learners-academy-1.1/logout @To logout (It will be redirected to Home page after logout)

# Project Flow

Step - 1.0 : A welcome page will be shown to User, where user find all the possible options to choose.

Step - 1.1 : User will only be allowed to view Home page and Login page if user is not logged in.

Step - 1.2 : To view any page except home and login page user must log in.

Step - 2.0 : To log out user can click on logout button.

Step - 3.0 : To view list of all the classes, user has to click on CLASSES link in the nav bar.

Step - 4.0 : To view detailed report of a class, user has to click on REPORT link in the nav bar.

Step - 5.0 : To view list of all the subjects, user has to click on SUBJECTS link in the nav bar.

Step - 6.0 : To view list of all the teachers, user has to click on TEACHERS link in the nav bar.

Step - 7.0 : To view detailed report of a particular teacher, user has to click on teacher name in the TEACHERS page, no
separate link is provided for that.

Step - 8.0 : To view list of all the students, user has to click on STUDENTS link in the nav bar.