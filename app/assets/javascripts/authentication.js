$(document).ready(function() {
  $("#log-in").on("click", function() {
    $(".log-in").fadeIn();
    $(".sign-up").fadeOut()
  });
  $("#sign-up").on("click", function() {
    $(".sign-up").fadeIn();
    $(".log-in").fadeOut()
  });
});
