$(document).on('turbolinks:load',function(){
  $(function() {
    $('.mypage__content__tabs > li').on('click', function(e) {
      e.preventDefault();

      console.log($(this).context.className);


      if ($(this).context.className != "active-mypage-tab") {
        $('.active-mypage-tab').removeClass('active-mypage-tab');
        $(this).addClass('active-mypage-tab');
      }

      // $('.non-active-mypage-tab').addClass('active-mypage-tab');
      // $('.non-active-mypage-tab').removeClass('non-active-mypage-tab');
      // $('.active-mypage-tab').addClass('non-active-mypage-tab');
      // $('.active-mypage-tab').removeClass('active-mypage-tab');
      // $('.mypage__content__tab-content__item-list--non').show();
      // $('.mypage__content__tab-content__item-list').hide();
    });
  });
});
