<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="ISO-8859-1" />
    <title>Learners's Academy</title>

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

      <!-- Container Begins -->
      <div class="fluid-container">
        <div class="px-3 py-3 pt-md-5 pb-md-4 mx-auto text-center">
          <h1 class="display-5">Welcome To Learner's Academy</h1>
          <p class="lead mt-3">
            An online management tool to view and manage Classes, Subjects and
            Teachers.
          </p>
        </div>

        <div class="card-deck text-center">
          <div class="card mb-4 box-shadow">
            <div class="card-body">
              <h6 class="card-title">
                <div
                  class="alert alert-warning alert-dismissible fade show"
                  role="alert"
                >
                  <strong>Note!</strong> You must login to view and manage data.
                  <button
                    type="button"
                    class="close"
                    data-dismiss="alert"
                    aria-label="Close"
                  >
                    <span aria-hidden="true">&times;</span>
                  </button>
                </div>
              </h6>

              <!-- Row Begin -->
              <div class="row">
                <!-- Tabs Headers Begin -->
                <div class="col-4">
                  <div class="list-group" id="list-tab" role="tablist">
                    <a
                      class="list-group-item list-group-item-action active"
                      id="list-classes-list"
                      data-toggle="list"
                      href="#list-classes"
                      role="tab"
                      aria-controls="classes"
                      >Classes</a
                    >
                    <a
                      class="list-group-item list-group-item-action"
                      id="list-subjects-list"
                      data-toggle="list"
                      href="#list-subjects"
                      role="tab"
                      aria-controls="subjects"
                      >Subjects</a
                    >
                    <a
                      class="list-group-item list-group-item-action"
                      id="list-teachers-list"
                      data-toggle="list"
                      href="#list-teachers"
                      role="tab"
                      aria-controls="teachers"
                      >Teachers</a
                    >

                    <a
                      class="list-group-item list-group-item-action"
                      id="list-students-list"
                      data-toggle="list"
                      href="#list-students"
                      role="tab"
                      aria-controls="students"
                      >Students</a
                    >
                    <a
                      class="list-group-item list-group-item-action"
                      id="list-report-list"
                      data-toggle="list"
                      href="#list-report"
                      role="tab"
                      aria-controls="report"
                      >Class Report</a
                    >
                  </div>
                </div>
                <!-- Tabs Headers End -->

                <!-- Tabs Content Begin -->
                <div class="col-8">
                  <div class="tab-content my-3" id="nav-tabContent">
                    <!-- Class Tab Begin -->
                    <div
                      class="tab-pane fade show active"
                      id="list-classes"
                      role="tabpanel"
                      aria-labelledby="list-classes-list"
                    >
                      <div class="container">
                        <h3 class="card-title pricing-card-title">
                          Master List of Classes
                        </h3>
                        <strong class="text-muted my-4 d-block"
                          >Here you can view the master list of all the Classes
                          of the school.</strong
                        >
                        <div class="d-block text-muted">
                          <a href="classes" class="btn btn-outline-success"
                            >View Classes</a
                          >
                        </div>
                      </div>
                    </div>
                    <!-- Class Tab End -->

                    <!-- Subjects Tab Begin -->
                    <div
                      class="tab-pane fade"
                      id="list-subjects"
                      role="tabpanel"
                      aria-labelledby="list-subjects-list"
                    >
                      <div class="container">
                        <h3 class="card-title pricing-card-title">
                          Master List of Subjects
                        </h3>
                        <strong class="text-muted my-4 d-block"
                          >Here you can view the master list of all the Subjects
                          of the school.</strong
                        >
                        <div class="d-block text-muted">
                          <a href="subjects" class="btn btn-outline-success"
                            >View Subjects</a
                          >
                        </div>
                      </div>
                    </div>
                    <!-- Subjects Tab Ends -->

                    <!-- Teachers Tab Begin -->
                    <div
                      class="tab-pane fade"
                      id="list-teachers"
                      role="tabpanel"
                      aria-labelledby="list-teachers-list"
                    >
                      <div class="container">
                        <h3 class="card-title pricing-card-title">
                          Master List of Teachers
                        </h3>
                        <strong class="text-muted my-4 d-block"
                          >Here you can view the master list of all the Teachers
                          of the school.</strong
                        >
                        <div class="d-block text-muted">
                          <a href="teachers" class="btn btn-outline-success"
                            >View Teachers</a
                          >
                        </div>
                      </div>
                    </div>
                    <!-- Teachers Tab End -->

                    <!-- Subjects Tab Begin -->
                    <div
                      class="tab-pane fade"
                      id="list-students"
                      role="tabpanel"
                      aria-labelledby="list-students-list"
                    >
                      <div class="container">
                        <h3 class="card-title pricing-card-title">
                          Master List of Subjects
                        </h3>
                        <strong class="text-muted my-4 d-block"
                          >Here you can view the master list of all
                          Subjects.</strong
                        >
                        <div class="d-block text-muted">
                          <a
                            href="class-subjects"
                            class="btn btn-outline-success"
                            >View Subjects</a
                          >
                        </div>
                      </div>
                    </div>
                    <!-- Subjects Tab End -->

                    <!-- Class Report Tab Begin -->
                    <div
                      class="tab-pane fade"
                      id="list-report"
                      role="tabpanel"
                      aria-labelledby="list-report-list"
                    >
                      <div class="container">
                        <h3 class="card-title pricing-card-title">
                          Class Report
                        </h3>
                        <strong class="text-muted my-4 d-block"
                          >Here you can view the Class Report. This tab contains
                          all information about Classes, Subjects and Teachers
                          for a perticular class.</strong
                        >
                        <div class="d-block text-muted">
                          <a href="classes" class="btn btn-outline-success"
                            >View Class Report</a
                          >
                        </div>
                      </div>
                    </div>
                    <!-- Class Report Tab End -->
                  </div>
                </div>
                <!-- Tabs Content End -->
              </div>
              <!-- Row End -->
            </div>
          </div>
        </div>
        <!-- Container Ends -->

        <!-- Footer Begins -->
        <jsp:include page="includes/footer.jsp" />
        <!-- Footer Ends -->
      </div>
    </div>
    <!-- Container Ends -->
  </body>
</html>
