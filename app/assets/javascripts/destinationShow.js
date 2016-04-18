$(document).on("ready page: load", function(){
  $(".destination-add-activity").hide()

  $(document).on('click', '.add-activity-btn', function(event){
    event.preventDefault();
    var parent = $(this).parent()
    var destination_id = parent[0].destination_id.value
    var activity_id = parent[0].activity_id.value
    $.ajax({
      url: '/destinations/' + destination_id + '/add_activity',
      method:"GET",
      data: {activity_id: activity_id, destination_id: destination_id}
    }).success(function(response, settings){
      $("#add_activity_" + response.id).html('<form id="remove_activity_' + response.id + '" action="/trips/' + response.id + '/remove_activity" method="GET" ><button type="submit" class="remove-activity-destination-btn"> X </button><a target="_blank" href="' + response.link + '">' + response.name + '</a><input type="hidden" name="destination_id" value="' + response.destination_id + '"><input type="hidden" name="activity_id" value="' + response.id + '"></form>')

    })
  })

  $(document).on('click', '.remove-activity-destination-btn', function(event){
    event.preventDefault();
    var parent = $(this).parent()
    var destination_id = parent[0].destination_id.value;
    var activity_id = parent[0].activity_id.value;
  
    
    $.ajax({
      url: '/trips/' + destination_id + '/remove_activity',
      method: "GET",
      data: {activity_id: activity_id, destination_id: destination_id}
    }).success(function(response, settings){
      $("#add_activity_" + response.id).html('<form id="add_activity_' + response.id + '" action="/destinations/' + response.id + '/add_activity" method="GET" ><button type="submit" class="add-activity-btn"> + </button><a target="_blank" href="' + response.link + '">' + response.name + '</a><input type="hidden" name="destination_id" value="' + response.destination_id + '"><input type="hidden" name="activity_id" value="' + response.id + '"></form>')

    })
    return false;
  })

  $(document).on('click', '.add-destination-btn', function(event){
    event.preventDefault();
    var destination_id = $("#destination_id").val()

    $.ajax({
      url: '/destinations/' + destination_id + '/add_destination',
      method: "GET",
      data: {id: destination_id}
    }).success(function(response, settings){
      $("#toggle-destination").addClass("remove-trip-destination-btn").removeClass('add-destination-btn')

      $(".destination-add-activity").addClass('add-activity-btn').removeClass("destination-add-activity") 
      $(".add-activity-btn").show()
      
    })

  })

    $(document).on('click', '.remove-trip-destination-btn', function(event){
      event.preventDefault();
      var destination_id = $("#destination_id").val()

      $.ajax({
        url: '/destinations/' + destination_id + '/remove_destination',
        method: "GET",
        data: {destination_id: destination_id}
      }).success(function(response, settings){
        $("#toggle-destination").addClass("add-destination-btn").removeClass("remove-trip-destination-btn")
        $(".destination-add-activity").hide() 
        $(".add-activity-btn").hide() 
        $('.remove-activity-destination-btn').hide()

      
    })

  })

    



})



