$(document).ready(function() {
  $("#sort").on("click", function() {
    $("#sort").toggleClass("desc")
    var sortedLinks = $(".all-links").children().sort(sortByLink)
    $(".all-links").replaceWith(sortedLinks)
  });

  $("#read").on("click", function() {
    $(".has-not-been-read").hide()
    $(".has-been-read").show()
  })

  $("#unread").on("click", function() {
    $(".has-been-read").hide()
    $(".has-not-been-read").show()
  })

  $("#all").on("click", function() {
    $(".has-been-read").show()
    $(".has-not-been-read").show()
  })

  $("#search").keyup("click", function() {
    searchBar($(this).val())
  })
});

function sortByLink(div1, div2) {
  if ($(div1).text().trim()[0] < $(div2).text().trim()[0]) {
    return -1
  } else if ($(div1).text().trim()[0] > $(div2).text().trim()[0]) {
    return 1
  } else {
    return 0
  }
}
function searchBar(text) {
  $.each($(".links"), function(index, div) {
    if (!$(div).text().includes(text)) {
      $(div).hide()
    } else {
      $(div).show()
    }
  })
}
