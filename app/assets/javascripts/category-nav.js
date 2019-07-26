$(document).on('turbolinks:load',function(){
  //親
  $('#header-category').hover(function(){
    $('.header-nav-parent-wrap').show();
  },function(){
    $('.header-nav-parent-wrap').hide();
  });

  //子
  $('.header-nav-parent').hover(function(){
    $(this).addClass('active');
    $('.header-nav-parent').css({'color':'#EA352E'});
    var children = $('.active').children('.header-nav-child-wrap');
    children.show();

  },function(){
    $(this).removeClass('active');
    $(this).children('.header-nav-child-wrap').hide();
    
  });

  //孫
  $('.header-nav-child').hover(function(){
    $(this).addClass('active-child')
    $('.header-nav-parent').css({'color':'#EA352E'});
    var grandChild = $('.active-child').children('.header-nav-grand-child-wrap')
    grandChild.show();

  },function(){
    $(this).removeClass('active-child');
    $(this).children('.header-nav-grand-child-wrap').hide();
  });
});