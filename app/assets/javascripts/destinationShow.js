// $(document).ready(function(){
//     var text = $(".add-destination-btn").children();
//     if (text === []){
//       $(document).click(".add-destination-btn", function(event){
//       event.preventDefault();
//       alert("hi");
//     })
//   }
// })

$(document).on("ready page: load", function(){
  $(document).on('click', ".add-activity-btn", function(event){
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



})



