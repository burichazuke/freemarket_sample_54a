$(document).on("turbolinks:load",function() {

  $(document).on('click', "#item__button", function(e) {
    // console.log("ok")
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
      $("#item__button").addClass('favorite')
      $('.fa-heart-o').addClass('fa-heart')
      $('.fa-heart-o').removeClass('fa-heart-o')

      var count = parseInt(count);
      console.log(count)
      $('#item__button').append(count)
      $('.favo-count').addClass('hidden')
      $('#item__button').attr('id', "favorited-button")
  //     // console.log($(this))
    })
    // .fail(function(){
    //   alert("sippai!")
    // })
  })

  $(document).on('click', "#favorited-button", function(e) {
    // console.log("ok")
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
      $("#item__button").removeClass('favorite')
      $('.fa-heart').addClass('fa-heart-o')
      $('.fa-heart').removeClass('fa-heart')
      console.log(count)
      count.to_i -= 1
      $('#item__button').append(count)
      $('.favo-count').addClass('hidden')
      $('#favorited-button').attr("id", "item__button")
  //     // console.log($(this))
    })
    .fail(function(){
      alert("sippai!")
    })
  })
})
