$(function(){

  var all_user_data = [];
  var matched_user = [];
  var selected_user = [];

  function get_user_name(id){
    for (var i=0; i<all_user_data.length; i++){
      if(parseInt(all_user_data[i].id) == parseInt(id)){
        return all_user_data[i].name
      }
    }
  }

  function buildHTML(data){
    var html = ""
    for(var i=0; i< data.length; i++){
      html = html + '<div class="match_users">' + get_user_name(data[i]) +
      '<button class="add_member_button" value="' + data[i] + '">追加' + '</button></div>';
    }
    $('#user-search-result').html(html);
  }

  function check_match(data_array){
    for(var i=0; i<data_array.length; i++){
      input_char_reg = new RegExp("^" + $('#user-input').val());
      if(data_array[i].name.match(input_char_reg)){
        matched_user.push(data_array[i].id);
      }
    }
    buildHTML(matched_user)
  }

  function set_value_to_hidden_field(){
    $('#post_name').val($('#chat_group_name').val());
    $('#post_id').val(selected_user);
  }

  //ユーザー名が入力された時の処理
  $(document).on('keydown', '#user-input', function(){
    $.ajax({
      method: 'GET',
      url: '/groups/new',
      contentType: false,
      dataType: 'json',
      success: function(data) {
        all_user_data = data;
        check_match(data);
      },
      error: function(error) {
        alert(error);
      }
    });
  });

  //ユーザーの追加がクリックされた時の処理
  $(document).on('click', '.add_member_button', function(e){

    html = '<div class="chat-group-form__field--right chat_member">' + get_user_name(this.value) +
    '<button class="chat_member_button" value="' + this.value + '">削除' + '</button></div>'

    selected_user.push(this.value);

    $('#add_user').append(html);
    $(this).parent().remove();
    set_value_to_hidden_field();

  });

  //削除ボタンがクリックされた時の処理
  $(document).on('click', '.chat_member_button', function(e){
    $(this).parent().remove();
    index = $.inArray(this.value, selected_user);
    if (index >= 0){
      selected_user.splice(index, 1);
    }
    set_value_to_hidden_field();
  });
})

