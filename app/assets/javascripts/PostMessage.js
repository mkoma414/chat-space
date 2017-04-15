$(function(){
  function buildHTML(message_data){
    var html = '<ul><li class="right-content__messages--name">' + message_data.user_name + '</li>' +
    '<li class="right-content__messages--date">' + message_data.date + '</li>' +
    '<li class="right-content__messages--text">' + message_data.body + '</li></ul>';

    return html;
  }
  $(document).on('submit', '#message_form', function(e){
    e.preventDefault();

    var form = $('#message_form').get()[0];
    var formData = new FormData( form );

    $.ajax({
      method: 'POST',
      url: location.href,
      contentType: false,
      processData: false,
      data: formData,
      dataType: 'json',
      success: function(data) {
        $('.right-content__messages').append(buildHTML(data));
        $('.right-content__post__text-area--text').val("");
        $('.right-content__post__send').prop("disabled", false);
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