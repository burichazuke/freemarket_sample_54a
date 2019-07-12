$(document).ready(function() {
  $('.non-active').on('click', function() {
    $('.mypage__content__tab-content__item-list').hide('');
  });
});

$(document).ready(function() {
  $('.non-active').on('click', function() {
    $('.mypage__content__tab-content__not-found.bold').show('');
  });
});



$(document).ready(function() {
  $('.active').on('click', function() {
    $('.mypage__content__tab-content__not-found.bold').hide('');
  });
});

$(document).ready(function() {
  $('.active').on('click', function() {
    $('.mypage__content__tab-content__item-list').show('');
  });
});

