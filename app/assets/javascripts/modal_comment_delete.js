$(document).on('turbolinks:load',function(){
  $('.delete-icon').on('click',function(e){
      e.preventDefault();
      var dataId = $(this).data('id');
      $(`#${dataId}`).fadeIn("slow");
  });
});