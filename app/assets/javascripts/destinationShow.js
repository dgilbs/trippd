$(document).ready(function(){
  $(".add-activity-btn").hide();
 
  $(".add-destination-btn").click(function(event){
    event.preventDefault();
    var destinationId = $(this).attr('id').split("-")[1];

    $.ajax({
      url: "/destinations/" + destinationId + "/add_destination",
      method: "GET"
    }).success(function(response, settings){
      $("button").first().hide();
      $(".add-activity-btn").show();
    })
  })

  $(".add-activity-btn").click(function(event){
    event.preventDefault();
      $(this).text('');
      $(this).removeClass('add-activity-btn').addClass('glyphicon glyphicon-ok');
    var destinationId = $(this).attr('id').split("-")[1];
    var activityId = $(this).parent().attr('id').split("-")[1];
    $.ajax({
      url: "/destinations/" + activityId + "/add_activity",
      method: "GET",
      data: {destination_id: destinationId} 
    }).success(function(response, settings){
    })
  });
})