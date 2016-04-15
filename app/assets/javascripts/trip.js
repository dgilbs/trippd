<<<<<<< HEAD
$(document).ready(function() {
   $(".email-trip-btn").click(function(event){
      event.preventDefault();
      var id = $(".email-trip-btn").val()
      $.ajax({
        url: '/email_trip',
        method: "POST",
        data: {id: id}
        }).success(function(response, setting){
      alert("Your trip was emailed! :) :)")
    })
    })
});
=======
// $(document).on("page:load ready", function() {
//    $(".email-trip-btn").click(function(event){
//       event.preventDefault();
//       var id = $(".email-trip-btn").val()
//       $.ajax({
//         url: '/email_trip',
//         method: "POST",
//         data: {id: id}
//         }).success(function(response, setting){
//       alert("Your trip was emailed! :) :)")
//     })
//     })
// });
>>>>>>> 5c8df1a9102acd8da390106bcd59c4b22dd22a19
