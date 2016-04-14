$(document).on("ready", function(){
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

      $("#new-packing-list").append('<div class="packing-list"> <h4>'+ name + '</h4><form id="new-item-form" action="/items" method="POST"><input type="text" id="new-item-name" placeholder="Add an item!"><input type="hidden" id="packing_list_id" name="packing_list_id" value="' + id +'"><input type="submit" id="submit-item-btn"></form><ul id="packing-list-' + id +'"></ul></div>');


      // $("#new-packing-list").append('<div class="packing-list"> <h4>'+ name + '</h4><ul id="packing-list-' + id +'"></ul><button class="add-list-item-btn" id="packing-list-' + id +'">Add Item</button></div>');


    })
    

  })

  $(document).on('click', '#submit-item-btn', function(event){
    event.preventDefault();
    var name = $("#new-item-name").val();
    var packing_list_id = $("#packing_list_id").val()    
    $.ajax({
      url: '/items',
      method:"POST",
      data: {name: name, packing_list_id: packing_list_id}
    }).success(function(response, settings){
      $("#packing-list-" + response.packing_list_id).append("<li>" + response.name + "</li>")
      
    })
  })

  $
})


    // <div id="new-packing-list">
    //   <div class='packing-list'>  
    //     <h4>Name</h4>
    //     <ul></ul>
    //   </div>
    // </div>


      //     $("#new-packing-list").append('<div class="packing-list"> <h4>'+ name + '</h4><form id="new-item-form" action="/items" method="POST">
      // <input type="text" id="new-item-name" placeholder="Add an item!">
      // <input type="hidden" id="packing_list_id" name="packing_list_id" value="' + id +'">
      // <input type="submit" id="submit-item-btn">
      // </form><ul id="packing-list-' + id +'"></ul></div>');