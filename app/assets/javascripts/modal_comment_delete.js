$(document).on('turbolinks:load',function(){
  $('.delete-icon').on('click',function(e){
      e.preventDefault();
      var dataId = $(this).data('id');
      console.log(dataId)
      $(`#${dataId}`).fadeIn("slow");
  });
});