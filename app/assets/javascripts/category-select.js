$(function(){
  function buildHTML(child){
    var html =`<option value="${child.id}">${child.name}</option>`;
    return html;
  }
  function appendChildrenBox(insertHtml){
    var childSelectHtml = '';
    childSelectHtml = `<div class="single__field__select",id="children_wrapper">
                        <select id="parent-form" name="item[category_ids][]">
                         <option value="">---</option>
                          ${insertHtml}
                        </select>
                       </div>`
    $('.single__field').append(childSelectHtml);
  }

  $("#parent-form").on("change",function(){
    var parentValue = document.getElementById("parent-form").value;
    if (parentValue != '---'){

      $.ajax({
        url: 'category',
        type:'GET',
        data:{parent_id: parentValue},
        dataType:'json'
      })

      .done(function(children){
        console.log(children)
        $('#children_wrapper').remove();
        var insertHtml = '';
        children.forEach(function(child){
          insertHtml += buildHTML(child);
        });
        appendChildrenBox(insertHtml)
      })

      .fail(function(){
        alert('通信に失敗しました。')
      })
    }else{
      //$('#children_wrapper').remove();
    }
  });
});