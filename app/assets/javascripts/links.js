$(document).ready(function() {
  $(".read").on("click", function() {
    $(this).closest("div").addClass("gray");
  });
  $(".unread").on("click", function() {
    $(this).closest("div").removeClass("gray");
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
