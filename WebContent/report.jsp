<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%> <%@ taglib uri="http://java.sun.com/jsp/jstl/core"
prefix="c"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="ISO-8859-1" />
    <title>Report | Learners's Academy</title>

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
          <h3 class="display-5">Detailed Report of ${cls.name }</h3>
          <p class="lead mt-3">
            You can click on the following links to view the respective details.
          </p>
        </div>

        <!-- Card Beigns -->
        <div class="accordion" id="classReport">
          <!-- Overview Card Begins -->
          <div class="card">
            <div class="card-header" id="headingOne">
              <h2 class="mb-0">
                <button
                  class="btn btn-link btn-block text-left text-decoration-none"
                  type="button"
                  data-toggle="collapse"
                  data-target="#overview"
                  aria-expanded="true"
                  aria-controls="overview"
                >
                  Overview
                </button>
              </h2>
            </div>

            <div
              id="overview"
              class="collapse show"
              aria-labelledby="headingOne"
              data-parent="#classReport"
            >
              <div class="card-body">
                <div class="info text-right">
                  <h5 class="card-title pricing-card-title text-info">
                    Overview of ${cls.name }
                  </h5>
                  <strong class="text-muted my-4 d-block"
                    >This tab shows brief info about the class.</strong
                  >
                </div>
                <table class="table table-hover">
                  <tbody>
                    <tr>
                      <th scope="row">Class Id</th>
                      <td>${cls.classId }</td>
                    </tr>
                    <tr>
                      <th scope="row">Class Name</th>
                      <td>${cls.name }</td>
                    </tr>
                    <tr>
                      <th scope="row">No.Of Seats</th>
                      <td>${cls.seats }</td>
                    </tr>
                    <tr>
                      <th scope="row">No.Of Students</th>
                      <td>${cls.strength }</td>
                    </tr>
                    <tr>
                      <th scope="row">No.Of Teachers</th>
                      <td>${cls.teachers.size() }</td>
                    </tr>
                  </tbody>
                </table>
              </div>
            </div>
          </div>
          <!-- Overview Card Ends -->

          <!-- Student Card Begins -->
          <div class="card">
            <div class="card-header" id="headingTwo">
              <h2 class="mb-0">
                <button
                  class="btn btn-link btn-block text-left text-decoration-none collapsed"
                  type="button"
                  data-toggle="collapse"
                  data-target="#students"
                  aria-expanded="false"
                  aria-controls="students"
                >
                  Students
                </button>
              </h2>
            </div>
            <div
              id="students"
              class="collapse"
              aria-labelledby="headingTwo"
              data-parent="#classReport"
            >
              <div class="card-body">
                <div class="info text-right">
                  <h5 class="card-title pricing-card-title text-success">
                    List of Students
                  </h5>
                  <strong class="text-muted my-4 d-block"
                    >This tab shows List of all Students belongs to this
                    class.</strong
                  >
                </div>
                <table class="table table-hover">
                  <thead>
                    <tr>
                      <th scope="col">S.No</th>
                      <th scope="col">Student Name</th>
                      <th scope="col">Age</th>
                      <th scope="col">Gender</th>
                      <th scope="col">Email ID</th>
                    </tr>
                  </thead>
                  <tbody>
                    <c:forEach var="student" items="${cls.students}">
                      <tr>
                        <th scope="row">${student.studentId }</th>
                        <td>${student.name }</td>
                        <td>${student.age }</td>
                        <td>${student.gender }</td>
                        <td>${student.emailId }</td>
                      </tr>
                    </c:forEach>
                  </tbody>
                </table>
              </div>
            </div>
          </div>
          <!-- Student Card Ends -->

          <!-- Subjects and Teachers Card Begins -->
          <div class="card">
            <div class="card-header" id="headingThree">
              <h2 class="mb-0">
                <button
                  class="btn btn-link btn-block text-left text-decoration-none collapsed"
                  type="button"
                  data-toggle="collapse"
                  data-target="#subjectsTeachers"
                  aria-expanded="false"
                  aria-controls="subjectsTeachers"
                >
                  Subjects & Teachers
                </button>
              </h2>
            </div>
            <div
              id="subjectsTeachers"
              class="collapse"
              aria-labelledby="headingThree"
              data-parent="#classReport"
            >
              <div class="card-body">
                <div class="info text-right">
                  <h5 class="card-title pricing-card-title text-danger">
                    List of Subjects and respective Teachers
                  </h5>
                  <strong class="text-muted my-4 d-block"
                    >This tab shows List of all Subjects and respective
                    Teachers. Click on the Teacher name for more
                    details.</strong
                  >
                </div>
                <table class="table table-hover">
                  <thead>
                    <tr>
                      <th scope="col">S.No</th>
                      <th scope="col">Subject Name</th>
                      <th scope="col">Teacher Name</th>
                    </tr>
                  </thead>
                  <tbody>
                    <c:forEach
                      begin="0"
                      end="${cls.teachers.size() - 1}"
                      varStatus="loop"
                    >
                      <tr>
                        <th scope="row">${loop.index + 1}</th>
                        <td>${cls.subjects[loop.index].name }</td>
                        <td>
                          <a
                            href="teacher?teacherId=${cls.teachers[loop.index].teacherId }"
                            >${cls.teachers[loop.index].name }</a
                          >
                        </td>
                      </tr>
                    </c:forEach>
                  </tbody>
                </table>
              </div>
            </div>
          </div>
          <!-- Subjects and Teachers Card Ends -->
        </div>
        <!-- Card Ends -->
        <!-- Pagination Begins -->
        <section class="mt-5">
          <nav aria-label="Page navigation example">
            <ul class="pagination justify-content-center">
              <li class="page-item ${1 == currentPage ? 'disabled' : ''}">
                <a
                  class="page-link"
                  href="report?classId=${currentPage - 1}"
                  tabindex="-1"
                  aria-disabled="true"
                  >Previous</a
                >
              </li>

              <c:forEach begin="1" end="${pages }" varStatus="loop">
                <li
                  class="page-item ${loop.index == currentPage ? 'disabled' : ''}"
                >
                  <a class="page-link" href="report?classId=${loop.index}"
                    >${loop.index}</a
                  >
                </li>
              </c:forEach>

              <li class="page-item ${pages == currentPage ? 'disabled' : ''}">
                <a class="page-link" href="report?classId=${currentPage + 1}"
                  >Next</a
                >
              </li>
            </ul>
          </nav>
        </section>
        <!-- Pagination Ends -->

        <!-- Footer Begins -->
        <jsp:include page="includes/footer.jsp" />
        <!-- Footer Ends -->
      </div>
      <!-- Fluid-Container Ends -->
    </div>
    <!-- Container Ends -->
  </body>
</html>
