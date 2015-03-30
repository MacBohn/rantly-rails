
function updateCountdown() {
  var remaining = jQuery('.message').val().length;
  jQuery('.countdown').text(remaining + " Characters");
}

jQuery(document).ready(function($) {
  updateCountdown();
  $('.message').change(updateCountdown);
  $('.message').keyup(updateCountdown);

  $(".cancel-button").click(function (e){
    e.preventDefault();
    $(".rant-box").fadeOut('slow');
  });

});
