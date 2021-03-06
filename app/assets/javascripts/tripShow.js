$(document).on('ready page:load', function(){
  $('.remove-activity-btn').hide();
  $('.remove-destination-btn').hide();

  $('.edit-trip-itinerary-btn').click(function(){
    $('.remove-activity-btn').toggle();
    $('.remove-destination-btn').toggle();
  })


  $("#new_packing_list").submit(function(event){
    event.preventDefault();
    var name = $("#packing_list_name").val()
    var tripId = $("#packing_list_trip_id").val() 
    $.ajax({
      url: '/packing_lists',
      method: 'POST',
      data: {trip_id: tripId, name: name}

    }).success(function(response, settings){
      var name = response.name
      var id = response.id
      $("#new-packing-list").append('<div class="packing-list-"' + id + '"> <h4 id="packing-list-name">'+ name + '</h4><form id="new-item-form-' + id + '"action="/items" method="POST"><input type="text" id="new-item-name" placeholder="Add an item!"><input type="hidden" id="packing_list_id" name="packing_list_id" value="' + id +'"><input type="submit" class="submit-item-btn"></form><ul id="packing-list-' + id +'"></ul></div>');
      $("#packing-list-form").hide()

    })
    return false;

  })

  $(document).off('click', '.submit-item-btn');
  $(document).on('click', '.submit-item-btn', function(event){
    event.preventDefault();
    var name = $("#new-item-name").val();
    var packing_list_id = $("#packing_list_id").val()   
    $.ajax({
      url: '/items',
      method:"POST",
      data: {name: name, packing_list_id: packing_list_id}
    }).success(function(response, settings){
      $("#packing-list-name").append('<li id="item-' + response.id + '"><button class="delete-item-btn">X</button>' + response.name + "</li>")
      $("#new-item-name").val(""); 
    })
    return false;
  })

  $(document).on('click', '.delete-item-btn', function(event){
    event.preventDefault();
    var parent = $(this).parent()
    var li_id = $(this).parent().attr("id").split("-")
    var item_id = li_id[(li_id.length-1)]
    $.ajax({
      url:'/items/' + item_id,
      method: 'DELETE'
    })
    parent.remove();
    return false;
  })

})




