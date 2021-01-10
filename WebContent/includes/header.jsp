<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%>
<!-- Toast Begins -->
<div
  class="toast position-absolute col-lg-4 col-sm-12 border"
  role="alert"
  id="toast-alert"
  aria-live="assertive"
  aria-atomic="true"
  data-animation="true"
  style="top: 5rem; right: 5rem"
>
  <div class="toast-header">
    <strong class="mr-auto">Learner's Academy</strong>
    <small class="text-muted">just now</small>
    <button
      type="button"
      class="ml-2 mb-1 close"
      data-dismiss="toast"
      aria-label="Close"
    >
      <span aria-hidden="true">&times;</span>
    </button>
  </div>
  <div class="toast-body" id="toast-body">Login Success</div>
</div>
<!-- Toast End -->

<% String user = (String) session.getAttribute("user"); %>

<!-- Nav-Bar Beigns -->
<div
  class="d-flex flex-column flex-md-row align-items-center p-3 px-md-4 mb-3 bg-white border-bottom box-shadow"
>
  <h5 class="my-0 mr-md-auto font-weight-normal">
    <a href="home">Learner's Academy</a>
  </h5>
  <nav class="my-2 my-md-0 mr-md-3">
    <a class="p-2 text-dark" href="classes">Classes</a>
    <a class="p-2 text-dark" href="subjects">Subjects</a>
    <a class="p-2 text-dark" href="teachers">Teachers</a>
    <a class="p-2 text-dark" href="students">Students</a>
    <a class="p-2 text-dark" href="report">Class Report</a>
  </nav>

  <% if(user == null || user.equals("")) {%>
  <a class="btn btn-outline-success mx-1" href="login">Login</a>
  <%}else { %>
  <div class="dropdown mx-1">
    <button
      class="btn btn-outline-primary dropdown-toggle"
      type="button"
      id="dropdownMenu2"
      data-toggle="dropdown"
      aria-haspopup="true"
      aria-expanded="false"
    >
      <%=user %>
    </button>
    <div class="dropdown-menu" aria-labelledby="dropdownMenu2">
      <button class="dropdown-item d-inline-block" type="button">
        <a class="btn btn-outline-primary w-100 mx-auto" href="logout"
          >Logout</a
        >
      </button>
    </div>
  </div>
  <%} %>
</div>
<!-- Nav-Bar Ends -->
