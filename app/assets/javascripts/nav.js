$(document).ready(function() {
  $("#sort").on("click", function() {
    console.log("hi")
  });

  $("#read").on("click", function() {
    $(".has-not-been-read").hide()
  })

  $("#unread").on("click", function() {
    $(".has-been-read").hide()
  })

  $("#unread").on("click", function() {
    console.log("hi")
  })
});
