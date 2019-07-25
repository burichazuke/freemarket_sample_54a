$(document).on('turbolinks:load',function(){
  let fileCollection = [];
  let fileNumber = 0;
  let deleteImages = [];

  if (location.pathname.match(/items\/\d+\/edit/)) {
    fileNumber += $(".sell-upload__item").length;
  }

  function buildImage(image) {
    let template = `<li class="sell-upload__item">
                      <div class="sell-upload__item__header">
                        <img src="${image}" class="sell-upload__item__header__image">
                      </div>
                      <div class="sell-upload__item__footer">
                        <a class="sell-upload__item__footer__btn sell-upload__item__footer__btn--edit">編集</a>
                        <a class="sell-upload__item__footer__btn sell-upload__item__footer__btn--remove">削除</a>
                      </div>
                    </li>`
    return template;
  }

  // ファイルの追加→表示
  $('#images').on('change', function(e) {
    let files = e.target.files;
    fileNumber += files.length;
    
    if (fileNumber > 10) {
      $('.sell-upload__error').show();
      fileNumber -= files.length;
    } else {
      if (fileNumber == 10) {
        $('.sell-upload__box').hide();
      }
      $('.sell-upload__error').hide();
      
      $.each(files, function(i, file) {
        fileCollection.push(file);
        let reader = new FileReader();
        reader.readAsDataURL(file);
        reader.onload = function(e) {
          let html = buildImage(e.target.result)
          $('.sell-upload__box').before(html);
        }
      });
    }
  });

  // ファイルの削除
  $(document).on('click', '.sell-upload__item__footer__btn--remove', function(e) {
    e.preventDefault();
    let index = $('.sell-upload__item__footer__btn--remove').index(this);
    if (index >= 0) {
      $('.sell-upload__item').eq(index).remove();
      fileCollection.splice(index, 1);
      fileNumber -= 1;

      console.log()
      // let imageNum = 
      // deleteImages.push(imageNum)
      if (fileNumber == 9) {
        $('.sell-upload__box').show();
      }
    }
  });

  //ajax通信 
  $('#single__form--sell').on('submit', function(e) {
    e.preventDefault();
    let formData = new FormData(this);
    
    for (var i = 0; i < fileCollection.length; i++ ) {
      formData.append('item[image_files][]', fileCollection[i]);
    }
    
    let type;
    if ($(this).context[1].value == "patch") {
      type = "PATCH"
    } else {
      type = "POST"
    }
    let url = $(this).attr('action');

    $.ajax({
      type: type,
      url: url,
      data: formData,
      dataType: "json",
      processData: false,
      contentType: false
    })
  })
});
