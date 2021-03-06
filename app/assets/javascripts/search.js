$(document).on('turbolinks:load',function(){

  $('#search-price').on('change',function(){
    var input = $(this).val();
    var array = input.split(',')
    $('#search-price-min').val(array[0]);
    $('#search-price-max').val(array[1])
  });

  $(document).on('change', '#grand-child_category' ,function(){
    var input = $(this).val();
    if(input == ""){
      var input = $('#search-child_category').val();
      $('#category-search').val(input);
    }else{
      $('#category-search').val(input);
    }
  });

  $(document).on('change', '#search-child_category' ,function(){
    var input = $(this).val();
    if(input == ""){
      var input = $('#parent-form').val();
      $('#category-search').val(input);
    }else{
    }
  });
  
  $(document).on('change', '#parent-form' ,function(){
    var input = $(this).val();
    $('#category-search').val(input);
  });

  // ここからカテゴリセレクトボックス  
  //セレクトボックスの中身（forEach用）
  function buildHTML(category){
    var html =`<option value="${category.id}" data-category="${category.id}">${category.name}</option>`;
    return html;
  }
  // 子のカテゴリーボックスを表示
  function appendChildrenBox(insertHtml){
    var childSelectHtml = '';
    childSelectHtml = `<div class="single__field__select" id="children_wrapper">
                        <select class="category-selected-child" id="search-child_category",name='category_id'>
                          <option value="",data-category="---">---</option>
                          ${insertHtml}
                        </select>
                        </div>`
    $('.category-select-box').append(childSelectHtml);
  }
    // 孫のカテゴリーボックスを表示
  function appendGrandChildrenBox(insertHtml){
    var grandchildHtml = '';
    grandchildHtml =  `<div class="single__field__select" id="grandchildren_wrapper">
                        <select id="grand-child_category" name='item[category_id]'>
                          <option value="",data-category="---">---</option>
                          ${insertHtml}
                        </select>
                      </div>`
    $('.category-select-box').append(grandchildHtml);
  }

    // 子のカテゴリーボックスを作る
  $("#search-parent-form").on("change",function(){
    var parentId = $("#search-parent-form").val();
    if (parentId != ''){
      $.ajax({
        url: 'category_children',
        type:'GET',
        data:{parent_id: parentId},
        dataType:'json'
      })
      .done(function(children){

        $('#children_wrapper').remove();
        $('#grandchildren_wrapper').remove();
        var insertHtml = '';
        children.forEach(function(child){
          insertHtml += buildHTML(child);
        });
        appendChildrenBox(insertHtml)

        $.ajax({
          url: 'category_parent',
          type:'GET',
          data:{parent_id: parentId},
          dataType:'json'
        })
        .done(function(parent){
          var input = '';
          parent.descendant_ids.forEach(function(id){
            input += id + " "
          })
          $('#category-search').val(input);
        })
        .fail(function(){
          alert('通信に失敗しました。')
        })

      })
      .fail(function(){
        alert('通信に失敗しました。')
      })
    }else{
      $('#children_wrapper').remove();
      $('#grandchildren_wrapper').remove();
    }
  });


  // 孫のカテゴリーボックスを作る
  $('.category-select-box').on('change','#search-child_category',function(){
    var childId = $('#search-child_category').val();
    if (childId != ''){
      $.ajax({
        url: 'category_grandchildren',
        type:'GET',
        data:{child_id: childId},
        dataType:'json'
      })
      .done(function(grandchildren){
        $('#grandchildren_wrapper').remove();
        var insertHtml = '';
        var input = '';
        grandchildren.forEach(function(grandchild){
          insertHtml += buildHTML(grandchild);
          input += grandchild.id + " "
        });
        appendGrandChildrenBox(insertHtml)
        $('#category-search').val(input);
      })
      .fail(function(){
        alert('通信に失敗しました。')
      })
    }else{
      $('#grandchildren_wrapper').remove();
    }
  });  
});