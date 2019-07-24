// $(document).on("turbolinks:load",function() {

//   // function buildHTML(favorite) {
//   // var html = `<a href= "favorite_path(item_id: @item.id)", method: :delete, id: "favorite-buttons", "data-item-id": "#{@item.id}","data-favo-id": "#{@item.favorites.count}", remote: true do>
//   //               <button class = "item__button" "favorite"
//   //                 <i class = fa_icon> "heart" </i>
//   //                 <span> いいね!</span> 
//   //                 = @item.favorites.count
//   //               </button>
//   //             </a>`
              
//   // return html;
//   // }


//   // $(document).on('click', "#favorite-buttons", function(e) {
//   $('#favorite-buttons').on('click', function(e) {
//     e.preventDefault();
//     var id = $(this).data("item-id")
//     var count = $(this).data("favo-id")
//     console.log(count);
//     // console.log(@item);
//     console.log("#{@item.id}");
    
//     // $.ajax({
//     //   url: /favorites/,
//     //   type: 'POST',
//     //   data: "#{@item.id}",
//     //   dataType: 'json',
//     //   processData: false,
//     //   contentType: false
//     // })

//     .done(function(data){
//       $("post").("post")
     
//       $("#item__button").addClass('favorite')
//       $('.fa-heart-o').addClass('fa-heart')
//       $('.fa-heart-o').removeClass('fa-heart-o')
//       count += 1
//       $('#item__button').append(count)
//       $('.favo-count').addClass('hidden')
//       console.log($(this))
//       $('#favorite-buttons').attr('id', "red-button")
      
//     })
//     .fail(function(){
//       alert("sippai!")
//     })
//   })




//   $(document).on('click', ".item__button", function(e) {
//     console.log("ok")
//     e.preventDefault();
//     var id = $(this).data("item-id")
//     var count = $(this).data("favo-id")
    
//     // $.ajax({
//     //   url: /favorite/,
//     //   type: 'DELETE',
//     //   data: "#{@item.id}",
//     //   dataType: 'json',
//     //   processData: false,
//     //   contentType: false
//     // })

//     // .done(function(data){
//       $("#item__button.favorite").removeClass('favorite')
//       $('.fa-heart').addClass('fa-heart-o')
//       $('.fa-heart').removeClass('fa-heart')
//       count -= 1
//       $('#item__button').remove(count)
//       $('.favo-count').addClass('hidden')

//     // })
//     // .fail(function(){
//     //   alert("sippai!")
//     // })
//   })
  
// })