$(document).on('turbolinks:load',function(){
  //セレクトボックスの中身（forEach用）
  function buildHTML(category){
    var html =`<option value="${category.id}" data-category="${category.id}">${category.name}</option>`;
    return html;
  }
  // 子のカテゴリーボックスを表示
  function appendChildrenBox(insertHtml){
    var childSelectHtml = '';
    childSelectHtml = `<div class="single__field__select" id="children_wrapper">
                        <select id="child_category" name="item[child_id]">
                          <option value="" data-category="---">---</option>
                          ${insertHtml}
                        </select>
                       </div>`
    $('.category-select-box').append(childSelectHtml);
  }
   // 孫のカテゴリーボックスを表示
  function appendGrandChildrenBox(insertHtml){
    var grandchildHtml = '';
    grandchildHtml =  `<div class="single__field__select" id="grandchildren_wrapper">
                        <select id="grandchild_category" name="item[category_id]">
                          <option value="" data-category="---">---</option>
                          ${insertHtml}
                        </select>
                      </div>`
    $('.category-select-box').append(grandchildHtml);
  }

   // 子のカテゴリーボックスを作る
  $("#parent-form").on("change",function(){
    // var parentValue = document.getElementById("parent-form").value;
    var parentId = $(this).val();
    if (parentId != ""){
      $.ajax({
        url: '/items/category_children',
        type: 'GET',
        data: {parent_id: parentId},
        dataType: 'json'
      })
      .done(function(children){
        $('#children_wrapper').remove();
        $('#grandchildren_wrapper').remove();
        var insertHtml = '';
        children.forEach(function(child){
          insertHtml += buildHTML(child);
        });
        appendChildrenBox(insertHtml);
      })
      .fail(function(){
        // alert('通信に失敗しました。')
        $('#children_wrapper').remove();
        $('#grandchildren_wrapper').remove();
      })
    } else {
      $('#children_wrapper').remove();
      $('#grandchildren_wrapper').remove();
    }
  });


  // 孫のカテゴリーボックスを作る
  $('.category-select-box').on('change','#child_category',function(){
    // var childId = $('#child_category option:selected').data('category');
    var childId = $(this).val();
    if (childId != ""){
      $.ajax({
        url: '/items/category_grandchildren',
        type: 'GET',
        data: {child_id: childId},
        dataType: 'json'
      })
      .done(function(grandchildren){
        $('#grandchildren_wrapper').remove();
        var insertHtml = '';
        grandchildren.forEach(function(grandchild){
          insertHtml += buildHTML(grandchild);
        });
        appendGrandChildrenBox(insertHtml)
      })
      .fail(function(){
        // alert('通信に失敗しました。')
        $('#grandchildren_wrapper').remove();
      })
    } else {
      $('#grandchildren_wrapper').remove();
    }
  });
});