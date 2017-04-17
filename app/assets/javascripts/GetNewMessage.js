  var timeNow = new Date();
  var lastUpdate = {};

  function set_last_update(){
    timeNow = new Date();
    lastUpdate = {date: Math.round(timeNow.getTime()/1000)};
  }

    function checkNewMessage(){
    $.ajax({
      method: 'GET',
      url: location.href,
      contentType: false,
      dataType: 'json',
      data: {last_update: lastUpdate}
    }).done(function(data){
        for(var i=0; i<data.length; i++){
          appendNewMessage(data[i]);
        }
    }).fail(function(error){
      alert("error");
    });
  }

  function appendNewMessage(data){
    var html = "<ul><li class='right-content__messages--name'>" + data.name +
                "</li><li class='right-content__messages--date'>" + data.create_date + "</li>" +
                "<li class='right-content__messages--text'>";
    if(data.text){
      html = html + data.text + "</li>" ;
    }
    if(data.image){
      html = html + "<img height = '200' src='" + data.image + "'>";
    }
    html += "</li></ul>";

    $('.right-content__messages').prepend(html);
    set_last_update();
  }

$(function(){

  set_last_update();
  setInterval(checkNewMessage, 3000);

});