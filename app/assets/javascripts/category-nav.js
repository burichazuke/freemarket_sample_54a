$(document).ready(function(){
  //必ず必要
  // var parentList = $('.header-nav-parent-wrap');
  // var parentListTrig = $('.header-nav-parent');
  // var childList = $('.header-nav-child-wrap');
  // var childListTrig =$('.header-nav-child');
  // var grandchildList = $('.header-nav-grand-child-wrap');
  // var grandchildListTrig =$('.header-nav-grand-child');

  //親
  $('#header-category').hover(function(){
    $('.header-nav-parent').show();
  },function(){
    $('.header-nav-parent').hide();
  });

  //子
  $('.header-nav-parent').hover(function(){
    
    $(this).children('.header-nav-child-wrap').show();
  },function(){
    $(this).children('.header-nav-child-wrap').hide();
  });

  //孫
  $('.header-nav-child').hover(function(){
    $(this).children('.header-nav-grand-child-wrap').show();
  },function(){
    $(this).children('.header-nav-grand-child-wrap').hide();
  });
  
});