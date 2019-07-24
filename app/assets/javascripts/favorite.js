$(document).on("turbolinks:load",function() {
  if #favorite-buttons != .favorite {

    $('#favorite-buttons').on('click', function(e) {
      e.preventDefault();
      var id = $(this).data("item-id")
      var count = $(this).data("favo-id")
      // console.log(count)
      $.ajax({
        url: /favorites/,
        type: 'POST',
        data: "#{@item.id}",
        dataType: 'json',
        processData: false,
        contentType: false
      })

      .done(function(data){
        $("#item__button").addClass('favorite')
        $('.fa-heart-o').addClass('fa-heart')
        $('.fa-heart-o').removeClass('fa-heart-o')
        count += 1
        $('#item__button').append(count)
        $('.favo-count').addClass('hidden')
        
      })
      .fail(function(){
        alert("sippai!")
      })
    })
  }

  else {

    $('#favorite-buttons.favorite').on('click', function(e) {
      console.log(this)
      e.preventDefault();
      var id = $(this).data("item-id")
      var count = $(this).data("favo-id")
      
      $.ajax({
        url: /favorite/,
        type: 'DELETE',
        data: "#{@item.id}",
        dataType: 'json',
        processData: false,
        contentType: false
      })

      .done(function(data){
        $("#item__button.favorite").removeClass('favorite')
        $('.fa-heart').addClass('fa-heart-o')
        $('.fa-heart').removeClass('fa-heart')
        count -= 1
        $('#item__button').remove(count)
        $('.favo-count').addClass('hidden')

      })
      .fail(function(){
        alert("sippai!")
      })
    })
  }
})