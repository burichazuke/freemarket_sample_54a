$(document).ready(function(){
  //親
  $('#header-category').hover(function(){
    $('.header-nav-parent-wrap').show();
  },function(){
    $('.header-nav-parent-wrap').hide();
  });

  //子
  $('.header-nav-parent').hover(function(){
    $(this).addClass('active');
    var children = $('.active').children('.header-nav-child-wrap');
    children.show();

  },function(){
    $(this).removeClass('active');
    $(this).children('.header-nav-child-wrap').hide();
    
  });

  //孫
  $('.header-nav-child').hover(function(){
    $(this).addClass('active2')
    var grandChild = $('.active2').children('.header-nav-grand-child-wrap')
    grandChild.show();

  },function(){
    $(this).removeClass('active2');
    $(this).children('.header-nav-grand-child-wrap').hide();
  });
});