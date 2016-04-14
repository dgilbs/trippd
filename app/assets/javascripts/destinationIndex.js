$(document).ready(function(){
  $('.search-terms').click(function(e){
    e.preventDefault();
    var query = $('.search-terms').val();
    $.ajax({
      url: '/destinations',
      method: 'POST',
      data: {query: query}
    })

  })
})