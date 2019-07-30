$(document).on('turbolinks:load',function(){
  $('#header-brand').hover(function(){
    $('.header-nav-brand-wrap').show();
  },function(){
    $('.header-nav-brand-wrap').hide();
  });

  $('.header-nav-brand-wrap__parent').hover(function(){
    $(this).addClass('active');
  },function(){
    $(this).removeClass('active');
  });
});