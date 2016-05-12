$(document).on('ready page:load', function(){
  $('.search-destination-btn').click(function(e){
    e.preventDefault();
    var query = $('.search-terms').val();
    debugger
    $.ajax({
      url: '/destinations',
      method: 'POST',
      data: {query: query}
    }).success(function(response, settings){
      city = response["city"];
      state = response["state"];
      country = response["country"];
      id = response["id"];
        $('#search-results').append('<button class="trip-btn"><a href="/destinations/' + id + '">' + city + '</button>');
    })
  })
})