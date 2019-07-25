$(document).on('turbolinks:load',function(){
  $('.header-nav__user--mypage').hover(function(){
    $('.mypage__nav').show();
  },function(){
    $('.mypage__nav').hide();
  });
});
