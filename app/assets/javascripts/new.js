$(document).on('turbolinks:load',function(){

  $('#price-form').on('keyup', function(e){
    var k = e.keyCode;
    var input = $(this).val()

    //販売価格300〜9,999,999、半角数字以外は入力不可
    if (input.search((/^[-]?[0-9]+$/) == 0 ) && (input >= 300 && input <= 9999999)) {
      
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
