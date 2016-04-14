$(document).ready(function(){
    var text = $(".add-destination-btn").children();
    if (text === []){
      $(document).click(".add-destination-btn", function(event){
      event.preventDefault();
      alert("hi");
    })
  }
})