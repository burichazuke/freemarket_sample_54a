$(document).on('turbolinks:load',function(){
  $('.category-thumb').click(function(){
    console.log(this)
    $(this).next().slideToggle();
  });

  $('.accordion-child__name').click(function(){
    $(this).next().slideToggle();
  })
});