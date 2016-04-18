$(document).ready(function(){
  $('.search-destination-btn').click(function(e){
    e.preventDefault();
    var query = $('.search-terms').val();
    $.ajax({
      url: '/destinations',
      method: 'POST',
      data: {query: query}
    }).success(function(response, settings){
      city = response["city"];
      state = response["state"];
      id = response["id"];
      // destination = Destination.find_or_create_by(city)   
        $('#search-results').append('<button class="trip-btn"><a href="/destinations/' + id + '">' + city + '</button>');
    })
  })
})