$(document).ready(function() {
  $(".read").on("click", function() {
    $(this).closest("div").addClass("gray");
  });
  $(".unread").on("click", function() {
    $(this).closest("div").removeClass("gray");
  });
});
