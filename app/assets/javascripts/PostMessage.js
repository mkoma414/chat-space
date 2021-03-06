$(function(){
  function buildHTML(message_data){

    var html = "<ul><li class='right-content__messages--name'>" + message_data.user_name + "</li>" +
                  "<li class='right-content__messages--date'>" + message_data.date + "</li>" +
                  "<li class='right-content__messages--text'>";
      if(message_data.body){
        html = html  + message_data.body;
      }
      if(message_data.image){
        html = html + "<br><img height = '200' class = 'right-content__messages--image src='" + message_data.image + "'><br>";
      }
      html += "</li></ul>";

      return html;
  }

  $(document).on('submit', '#message_form', function(e){
    e.preventDefault();

    var form = $('#message_form').get()[0];
    console.log(form);
    var formData = new FormData( form );

    $.ajax({
      method: 'POST',
      url: location.href,
      contentType: false,
      processData: false,
      data: formData,
      dataType: 'json',
      success: function(data) {
        checkNewMessage();
        $('.right-content__post__text-area--text').val("");
        $('.right-content__post__send').prop("disabled", false);
        set_last_update();
      },
      error: function(error) {
        alert(error);
      }
    });
  });

  $(document).on('click', '.right-content__post__text-area--pict-icon', function(){
    $('#image_upload').click();
  });

});