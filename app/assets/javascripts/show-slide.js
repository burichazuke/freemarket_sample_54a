$(document).on('turbolinks:load',function(){
  $('.item__photo__container__img').on('mouseover', function(){
    $(this).delay(700).queue(function(){
      $('.active-img').removeClass('active-img')
      $(this).stop().addClass('active-img');
      var id = $('.active-img').data("id");
      console.log(id)
      $('.item__photo__slide').animate({"left": id * -300 + "px", duration:'easeInOutExpo'});      
    });
  });
});

