$(function(){

  $('#price-form').on('keyup', function(e){
    var k = e.keyCode;
    var input = $(this).val()

    if (input.search(/^[-]?[0-9]+$([3-9][0-9][0-9]|9999999)/) == 0 ) {
      
      var fee = input * 0.1 
      //Math.floor 小数点切り下げ
      fee = String(Math.floor(fee)).replace( /(\d)(?=(\d\d\d)+(?!\d))/g, '$1,');
      $('#sellfee').html("¥" + fee)

      var profit = input * 0.9
      //Math.ceil 少数点切り上げ
      profit = String(Math.ceil(profit)).replace( /(\d)(?=(\d\d\d)+(?!\d))/g, '$1,');
      $('#sellprofit').html("¥" + profit)

    } else {
      $('#sellfee').html('-')
      $('#sellprofit').html('-')
    }
  })
});

// var input = input >= 300 && input <= 9999999
// (300..9999999).include?this
