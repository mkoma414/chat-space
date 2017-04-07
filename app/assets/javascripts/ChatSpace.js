$(function(){

  function buildHTML(message_data){
    var html = $('<ul>')
    .append($('<li class="right-content__messages--name">' + message_data.user_name + '</li>'))
    .append($('<li class="right-content__messages--date">' + message_data.date + '</li>'))
    .append($('<li class="right-content__messages--text">' + message_data.body + '</li></ul>'));

    return html;
  }
  $(document).on('submit', '.message_form', function(e){
    e.preventDefault();

    message = $('.right-content__post__text-area--text').val();

    $.ajax({
      type: 'POST',
      url: location.href,
      contentType: 'application/json',
      cache: false,
      data: JSON.stringify({
        message: {
          body: message
        }
      }),
      dataType: 'json',
      success: function(data) {
        $('.right-content__messages').append(buildHTML(data));
        $('.right-content__post__text-area--text').val("")
      },
      error: function(error) {
        alert(error);
      }
    });
  });
});