$(document).on("turbolinks:load",function() {

  $(document).on('click', "#item__button", function(e) {
    e.preventDefault();
    var id = $(this).data("item-id")
    var count = $(this).data("favo-id")
    console.log(id)
    $.ajax({
      url: /favorites/,
      type: 'POST',
      data: { item_id: id},
      dataType: 'json',
    })

    .done(function(data){
      $('.fa-heart-o').addClass('fa-heart')
      $('.fa-heart-o').removeClass('fa-heart-o')
      $('#item__button').attr('id', 'favorited-button')
      num = Number($('.xxx').text()) + 1
      $('.xxx').text(num)
    })
  })

  $(document).on('click', "#favorited-button", function(e) {
    e.preventDefault();
    var id = $(this).data("item-id")
    var count = $(this).data("favo-id")
    console.log(id)
    $.ajax({
      url: '/favorites/:id',
      type: 'DELETE',
      data: { item_id: id },
      dataType: 'json',
    })

    .done(function(data){
      $('.fa-heart').addClass('fa-heart-o')
      $('.fa-heart').removeClass('fa-heart')
      $('#favorited-button').attr("id", "item__button")
      $('#favorited-button').attr("id", "item__button")
      num = Number($('.xxx').text()) - 1
      $('.xxx').text(num)
    })
  })
})
