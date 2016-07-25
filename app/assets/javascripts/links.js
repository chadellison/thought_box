$(document).ready(function() {
  $(".read").on("click", function() {
    $(this).closest("div").addClass("gray");
    $(this).closest("div").addClass("has-been-read")
    $(this).closest("div").removeClass("has-not-been-read")
  });
  $(".unread").on("click", function() {
    $(this).closest("div").removeClass("gray");
    $(this).closest("div").addClass("has-not-been-read")
    $(this).closest("div").removeClass("has-been-read")
  });

  $(".edit").on("click", function() {
    $(this).fadeOut()
    $("#edit-" + this.id).fadeIn()
  })

  $(".update").on("click", function() {
    $(this).closest("div").fadeOut()
    $(".edit").fadeIn()
  })
});
