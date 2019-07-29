$(document).on('click', "#item__button", function(e) {
  e.preventDefault();
  var id = $(this).data("item-id")

  $.ajax({
    url: '/favorites',
    type: 'POST',
    data: { item_id: id},
    dataType: 'json',
  })

  .done(function(data){
    $('.favorite.fa-heart-o').addClass('fa-heart')
    $('.favorite.fa-heart-o').removeClass('fa-heart-o')
    $('#item__button').attr('id', 'favorited-button')
    num = Number($('.favorite_count').text()) + 1;
    $('.favorite_count').text(num)
  })
})

$(document).on('click', "#favorited-button", function(e) {
  e.preventDefault();
  var id = $(this).data("item-id")
  
  $.ajax({
    url: '/favorites',
    type: 'DELETE',
    data: { item_id: id },
    dataType: 'json',
  })

  .done(function(data){
    $('.favorite.fa-heart').addClass('fa-heart-o')
    $('.favorite.fa-heart').removeClass('fa-heart')
    $('#favorited-button').attr("id", "item__button")
    num = Number($('.favorite_count').text()) - 1;
    $('.favorite_count').text(num)
  })
})
