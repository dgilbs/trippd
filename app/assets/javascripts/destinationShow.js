$(document).on("ready page: load", function(){
  $(".destination-add-activity").hide()

  $(document).on('click', '.add-destination-btn', function(event){
    event.preventDefault();
    var destination_id = $("#destination_id").val();

    $.ajax({
      url: '/trip_destinations',
      method: "POST",
      data: {id: destination_id}
    }).success(function(response, settings){
      $("#toggle-destination").addClass("remove-trip-destination-btn").removeClass('add-destination-btn')
      $(".destination-add-activity").addClass('add-activity-btn').removeClass("destination-add-activity") 
      $(".destination-add-activity").hide()
      $(".add-activity-btn").show()
    })
  })

  $(document).on('click', '.remove-trip-destination-btn', function(event){
    event.preventDefault();
    var destination_id = $("#destination_id").val()
    $.ajax({
      url: '/trip_destinations/' + destination_id,
      method: "GET",
      data: {destination_id: destination_id}
    }).success(function(response, settings){
      $("#toggle-destination").addClass("add-destination-btn").removeClass("remove-trip-destination-btn")
      $(".destination-add-activity").hide() 
      $(".add-activity-btn").hide() 
      $('.remove-activity-destination-btn').hide()
    })
  })

  $(document).on('click', '.add-activity-btn', function(event){
    event.preventDefault();
    var destination_id = $(this).parent().attr('id').split("-")[1]
    var activity_id = $(this).attr('id').split("-")[1]
    $.ajax({
      url: '/trip_activities',
      method:"GET",
      data: {activity_id: activity_id, destination_id: destination_id}
    }).success(function(response, settings){
      $("#activity-" + response.id).addClass('remove-activity-destination-btn').removeClass('add-activity-btn')
      $("#activity-" + response.id).text("X")

    })
  })

  $(document).on('click', '.remove-activity-destination-btn', function(event){
    event.preventDefault();
    var destination_id = $(this).parent().attr('id').split("-")[1]
    var activity_id = $(this).attr('id').split("-")[1]
    $.ajax({
      url: '/trip_activities/' + destination_id,
      method: "GET",
      data: {activity_id: activity_id}
    }).success(function(response, settings){
      $("#activity-" + response.id).addClass('add-activity-btn').removeClass('remove-activity-destination-btn')
      $("#activity-" + response.id).text("+")

    })
    return false;
  })



    



})


