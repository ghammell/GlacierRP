$(document).ready( function() {
  BindUserControls('#log_in', '/users/sign_in')
  BindUserControls('#sign_up', '/users/sign_up')
})

var BindUserControls = function(button, path) {
  $(button).on('click', function() {
    $.ajax({
      method: 'GET',
      url: path
    })
    .done(function(data){
      $('.modal-content').empty()
      $('.modal-content').prepend(data)
      $('.modal').modal('show')
    })
    $('.user_controls').off()
  })
}
