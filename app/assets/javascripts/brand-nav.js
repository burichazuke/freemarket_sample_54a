$(document).on('turbolinks:load',function(){
  $('#header-brand').hover(function(){
    $('.header-nav-parent-wrap2').show();
  },function(){
    $('.header-nav-parent-wrap2').hide();
  });

  $('.header-brand-nav-parent').hover(function(){
    $(this).addClass('active');
  },function(){
    $(this).removeClass('active');
  });
});