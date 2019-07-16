$(document).on('turbolinks:load',function(){
  $(function() {
    $('.mypage__content__tab').on('click', function(e) {
      e.preventDefault();
      let num = 0
      var index = $('.mypage__content__tab').index(this);

      switch( index ) {
        case 0: 
          num = 1;
          break;
        case 1: 
          num = 0;
          break;
        case 2: 
          num = 3;
          break;
        case 3: 
          num = 2;
          break;
      }

      $('.mypage__content__tab').eq(num).removeClass('active-mypage-tab');
      $(this).addClass('active-mypage-tab');
      $('.mypage__content__tab-content__item-list').eq(num).removeClass('show-mypage-tab');
      $('.mypage__content__tab-content__item-list').eq(index).addClass('show-mypage-tab');

    });
  });
});
