$(document).ready(function() {
  $("#sort").on("click", function() {
    console.log("hi")
    $(".links")
    $(".all-links").append($(".links").text().split("Edit").sort(".links"))
  });

  $("#read").on("click", function() {
    $(".has-not-been-read").hide()
  })

  $("#unread").on("click", function() {
    $(".has-been-read").hide()
  })

  $("#search").keyup("click", function() {
    var text = $(this).val()
    $.each($(".links"), function(index, div) {
      if (!$(div).text().includes(text)) {
        $(div).hide()
      }
    })
  })
});
