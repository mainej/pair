$(document).foundation();
$(function() {
  setTimeout(function() {
    $(".alerts .close").each(function(i, e) {
      e.click();
    });
  }, 3000);
});
