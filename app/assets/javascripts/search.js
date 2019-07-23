$(document).on('turbolinks:load',function(){
  $('#search-price').on('change',function(){
    var input = $(this).val();
    var array = input.split(',')
    $('#search-price-min').val(array[0]);
    $('#search-price-max').val(array[1])
  })
});