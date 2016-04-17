$(document).on('ready page:load', function() {
   $('#tellfriend').hide();
    $('.email-trip-btn, #tellfriend a.close').click(function(event) {
      event.preventDefault();
      $("#tellfriend").fadeToggle('slow');
    })
    $('.form_but').click(function(event) {
      event.preventDefault();
      var id = $(".email-trip-btn").val()
      var email = $("#to").val()
      var sender = $("#name").val()
      $.ajax({
        url: '/email_trip',
        method: "POST",
        data: {id: id, email: email, sender: sender}
    }).success(function(response, setting){
      $('#tellfriend').hide();
    });
  });
});