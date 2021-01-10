<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%>
<footer class="my-sm-4 pt-md-2 my-lg-2 pt-lg-5 border-top">
  <div class="mx-2">
    <div class="col-12 col-md text-center">
      Learner's Academy
      <span class="d-inline-block text-muted">
        &nbsp | &nbsp Designed & Developed By</span
      >
      <strong>Riyaz J</strong>
    </div>
  </div>
</footer>

<!-- Bootstrap core JavaScript
    ================================================== -->
<!-- Placed at the end of the document so the pages load faster -->
<script
  src="https://code.jquery.com/jquery-3.5.1.slim.min.js"
  integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
  crossorigin="anonymous"
></script>
<script
  src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"
  integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN"
  crossorigin="anonymous"
></script>
<script
  src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.min.js"
  integrity="sha384-w1Q4orYjBQndcko6MimVbzY0tgp4pWB4lZ7lr30WKz0vr/aWKhXdBNmNb5D92v7s"
  crossorigin="anonymous"
></script>

<script>
  $(document).ready(function () {
    const url = window.location.href;

    if (url.includes("?login-successful"))
      toast("Login Successful", "text-success", "border-success");
    else if (url.includes("?logout-successful"))
      toast("Logout Successful", "text-success", "border-success");
    else if (url.includes("?user-exists"))
      toast(
        "You should Logout first to Login again.",
        "text-danger",
        "border-danger"
      );

    function toast(message, textColor, borderColor) {
      const alert = $("#toast-alert");
      const body = $("#toast-body");

      body.addClass(textColor);
      body.text(message);

      alert.addClass(borderColor);
      alert.toast({ delay: 5000 });
      alert.toast("show");
    }
  });
</script>
