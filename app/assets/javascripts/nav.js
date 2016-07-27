$(document).ready(function() {
  $("#sort").on("click", function() {
    $(".links").toggleClass("desc")
    var links = $(".links")
    $(".all-links").children().remove()

    sortedLinks = links.sort(sortByLink)

    if (links.hasClass("desc")) {
      sortedLinks = sortedLinks.get().reverse()
    }

    $.each(sortedLinks, function(index, div) {
      $(".all-links").append(div)
    })
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
