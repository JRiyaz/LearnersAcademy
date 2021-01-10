<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%> <%@ taglib uri="http://java.sun.com/jsp/jstl/core"
prefix="c"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="ISO-8859-1" />
    <title>Teachers | Learners's Academy</title>

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
          <h3 class="display-5">Master List Of Teachers</h3>
          <p class="lead mt-3">
            Here you have the master list of all the Teachers with respective
            Subjects with pagination support. Click on the teacher to find more
            details.
          </p>
        </div>

        <!-- Table Content Begin -->
        <table class="table table-hover">
          <thead>
            <tr>
              <th scope="col">S.No</th>
              <th scope="col">Teacher Name</th>
            </tr>
          </thead>
          <tbody>
            <c:forEach items="${teachers}" var="teacher">
              <tr>
                <th scope="row">${teacher.teacherId }</th>
                <td>
                  <a href="teacher?teacherId=${teacher.teacherId }"
                    >${teacher.name }</a
                  >
                </td>
              </tr>
            </c:forEach>
          </tbody>
        </table>
        <!-- Table Content Ends -->

        <!-- Pagination Begins -->
        <section class="mt-5">
          <nav aria-label="Page navigation example">
            <ul class="pagination justify-content-center">
              <li class="page-item ${1 == currentPage ? 'disabled' : ''}">
                <a
                  class="page-link"
                  href="teachers?page=${currentPage - 1}"
                  tabindex="-1"
                  aria-disabled="true"
                  >Previous</a
                >
              </li>

              <c:forEach begin="1" end="${pages }" varStatus="loop">
                <li
                  class="page-item ${loop.index == currentPage ? 'disabled' : ''}"
                >
                  <a class="page-link" href="teachers?page=${loop.index}"
                    >${loop.index}</a
                  >
                </li>
              </c:forEach>

              <li class="page-item ${pages == currentPage ? 'disabled' : ''}">
                <a class="page-link" href="teachers?page=${currentPage + 1}"
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
