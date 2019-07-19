$(document).on('turbolinks:load',function(){
  $('.item__photo__container__img:first').addClass('active-img');
  $('.item__photo__container__img').hover(function(){
    var target = $(this)
    setHover= setTimeout(function(){
      $('.active-img').removeClass('active-img');
      $(target).addClass('active-img');
      var id = $('.active-img').data("id");
      console.log(id)
      $('.item__photo__slide').animate({"left": id * -300 + "px", easing:'easeInOutExpo'}); 
    },700)
  },function(){
    clearTimeout(setHover)
  });
});
