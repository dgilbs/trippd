$(document).ready(function() {
   $('#tellfriend').hide();
    $('.email-trip-btn, #tellfriend a.close').click(function(event) {
      event.preventDefault();
      $("#tellfriend").fadeToggle('slow');
    })
    $('.form_but').click(function(event) {
      event.preventDefault();
      var id = $(".email-trip-btn").val()
      $.ajax({
        url: '/email_trip',
        method: "POST",
        data: {id: id}
    }).success(function(response, setting){
      $('#tellfriend').hide();
    });
  });
});