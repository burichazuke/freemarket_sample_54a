$(function() {
  $(".delete-icon").click(function(){
    $('.modal-window').fadeIn();
  });
  $('.modal-window-body__form__btn').click(function() {
    $('.modal-window').fadeOut();
  });
});