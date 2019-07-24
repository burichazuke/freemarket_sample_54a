$(document).on('turbolinks:load',function(){
  let fileCollection = new Array();

  // ファイルの追加→表示
  $('#images').on('change', function(e) {
    let files = e.target.files;
    $.each(files, function(i, file) {
      fileCollection.push(file);
      let reader = new FileReader();
      reader.readAsDataURL(file);
      reader.onload = function(e) {
        let template = `<li class="sell-upload__item">
                          <div class="sell-upload__item__header">
                            <img src="${e.target.result}" class="sell-upload__item__header__image">
                          </div>
                          <div class="sell-upload__item__footer">
                            <a class="sell-upload__item__footer__btn sell-upload__item__footer__btn--edit">編集</a>
                            <a class="sell-upload__item__footer__btn sell-upload__item__footer__btn--remove">削除</a>
                          </div>
                        </li>`

        $('.sell-upload__items').append(template);
      }
    });
  });

  // ファイルの削除
  $(document).on('click', '.sell-upload__item__footer__btn--remove', function(e) {
    e.preventDefault();
    let index = $('.sell-upload__item__footer__btn--remove').index(this);
    $('.sell-upload__item').eq(index).remove();
    fileCollection.splice(index, 1);
  });


  $('#single__form--sell').on('submit', function(e) {
    e.preventDefault();
    let formData = new FormData(this);
    
    for (var i = 0; i < fileCollection.length; i++ ) {
      formData.append('item[image_files][]', fileCollection[i]);  
    }
    let url = $(this).attr('action');

    $.ajax({
      type: "POST",
      url: url,
      data: formData,
      dataType: "json",
      processData: false,
      contentType: false
    })
  })
});
