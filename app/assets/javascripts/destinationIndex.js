$(document).ready(function(){
  $('.search-destination-btn').click(function(e){
    e.preventDefault();
    var query = $('.search-terms').val();
    $.ajax({
      url: '/destinations',
      method: 'GET',
      data: {query: query}
    }).success(function(response, settings){
      for(var i=0; i < response.length; i++){
        var city = response[i].city;
        var  id = response[i].id;
        $('#search-results').append('<button class="trip-btn"><a href="/destinations/' + id +'">'+ city + '</button>');
      }
    })

  })
})