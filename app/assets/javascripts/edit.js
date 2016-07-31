$(document).ready(function() {
  $(".update").on("click", function() {
    // console.log($(this).siblings(".title").val())
  $("." + this.id).text($(this).siblings(".title").val())
  })
});
