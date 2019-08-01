$(document).on('turbolinks:load',function(){

  // 子のアコーディオン
  $('.category-thumb').click(function(){
    $(this).next().slideToggle();
  });
  
  // 孫のアコーディオン
  $('.accordion-child__name').click(function(){
    $(this).next().slideToggle();
  })
});