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
  })

  $("#unread").on("click", function() {
    $(".has-been-read").hide()
  })
  $("#all").on("click", function() {
    $(".has-been-read").show()
    $(".has-not-been-read").show()
  })

  $("#search").keyup("click", function() {
    var text = $(this).val()
    $.each($(".links"), function(index, div) {
      if (!$(div).text().includes(text)) {
        $(div).hide()
      } else {
        $(div).show()
      }
    })
  })
});

function removeLinks() {
  $(".has-not-been-read").hide()
  $(".has-been-read").hide()
}

function sortByLink(div1, div2) {
  if ($(div1).text().trim()[0] < $(div2).text().trim()[0]) {
    return -1
  } else if ($(div1).text().trim()[0] > $(div2).text().trim()[0]) {
    return 1
  } else {
    return 0
  }
}
