$(document).on('turbolinks:load',function(){
  $('.header-user-img').hover(function(){
    $('.mypage__nav').show();
  },function(){
    $('.mypage__nav').hide();
  });
});