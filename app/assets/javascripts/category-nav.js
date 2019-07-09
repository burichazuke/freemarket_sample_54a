$(document).ready(function(){
  //必ず必要
  $('#header-category').hover(
    function(){
      $('.header-nav-parent').show();
    },
    function(){
      $('.header-nav-parent').hide();
    }
  );


  
  //addClassでhover箇所を指定する
  $('#header-nav-parent').hover(
    function(){
      $('.header-nav-child').show();

    },
    function(){
      $('.header-nav-child').hide();
    } 
  );

  $('#headeer-nav-child').hover(
    function(){
      $('.header-nav-grand-child').show();

    },
    function(){
      $('.header-nav-grand-child').hide();
    } 
  );
});