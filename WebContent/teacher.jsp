<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%> <%@ taglib uri="http://java.sun.com/jsp/jstl/core"
prefix="c"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="ISO-8859-1" />
    <title>Teacher | Learners's Academy</title>

    <!--  Bootstrap CSS-->
    <link
      rel="stylesheet"
      href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css"
      integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2"
      crossorigin="anonymous"
    />

    <style>
      a,
      a:hover {
        text-decoration: none;
      }
    </style>
  </head>

  <body>
    <!-- Container Begins -->
    <div class="container">
      <!-- Header Begins -->
      <jsp:include page="includes/header.jsp" />
      <!-- Header Ends -->

      <!-- Fluid-Container Begins -->
      <div class="fluid-container">
        <div class="px-3 py-3 pt-md-5 pb-md-4 mx-auto text-center">
          <h3 class="display-5">Details of ${teacher.name }</h3>
          <p class="lead mt-3">
            Here you will find complete details of the teacher.
          </p>
        </div>

        <!-- Table Content Beigns -->
        <table class="table table-hover">
          <tbody>
            <tr>
              <th scope="col">S.No</th>
              <td>${teacher.teacherId }</td>
            </tr>
            <tr>
              <th scope="col">Teacher Name</th>
              <td>${teacher.name }</td>
            </tr>
            <tr>
              <th scope="col">Age</th>
              <td>${teacher.age }</td>
            </tr>
            <tr>
              <th scope="col">Gender</th>
              <td>${teacher.gender }</td>
            </tr>
            <tr>
              <th scope="col">Email ID</th>
              <td>${teacher.emailId }</td>
            </tr>
            <tr>
              <th scope="col">Subjects</th>
              <td class="d-flex px-0">
                <c:forEach var="subject" items="${teacher.subjects}">
                  <span class="mx-1 badge badge-pill badge-primary p-2"
                    >${subject.name }</span
                  >
                </c:forEach>
              </td>
            </tr>
            <tr>
              <th scope="col">Classes</th>
              <td class="d-flex px-0">
                <c:forEach var="classes" items="${teacher.classes}">
                  <span class="mx-1 badge badge-pill badge-success p-2"
                    >${classes.name }</span
                  >
                </c:forEach>
              </td>
            </tr>
          </tbody>
        </table>
        <!-- Table Content Ends -->

        <!-- Footer Begins -->
        <jsp:include page="includes/footer.jsp" />
        <!-- Footer Ends -->
      </div>
      <!-- Fluid-Container Ends -->
    </div>
    <!-- Container Ends -->
  </body>
</html>
