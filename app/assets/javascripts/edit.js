$(document).ready(function() {
  $(".update").on("click", function() {
    $("." + this.id).text($(this).siblings(".title").val())
  })
});
