$(function(){
  $('#price-form').on('keyup',function(){
    var input = $(this).val();
   
    var fee = input * 0.1
    $('#sellfee').html('¥' + fee)
 
    var profit = input * 0.9
    $('#sellprofit').html('¥' + profit)
    

  })
})