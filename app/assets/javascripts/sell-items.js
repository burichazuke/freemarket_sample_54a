$(document).on('turbolinks:load',function() {
  let setFileNumber = 0;
  let totalFileNumber = 0;
  let newFileCollection = [];
  let updateFileCollection = [];
  let deleteFileCollection = [];
  

  if (location.pathname.match(/items\/\d+\/edit/)) {
    setFileNumber += $(".sell-upload__item").length;
    totalFileNumber += setFileNumber 
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

  function descendingSort(a, b) {
    return b - a;
  }

  // ファイルの追加→表示
  $('#images').on('change', function(e) {
    let files = e.target.files;
    totalFileNumber += files.length;
    
    if (totalFileNumber > 10) {
      $('.sell-upload__error').show();
      totalFileNumber -= files.length;
    } else {
      if (totalFileNumber == 10) {
        $('.sell-upload__box').hide();
      }
      $('.sell-upload__error').hide();
      
      $.each(files, function(i, file) {
        newFileCollection.push(file);
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

      // 元々あったファイルはdeleteFileCollectionに入れて、新しいファイルはnewFileCollectionから削除する
      if (index < setFileNumber) {
        let deleteNum = Number($(this).data('image-name').slice(-1));
        deleteFileCollection.push(deleteNum);
        setFileNumber -= 1;
        totalFileNumber -= 1;
      } else {
        newFileCollection.splice(index - setFileNumber, 1);
        totalFileNumber -= 1;
      }
      
      if (totalFileNumber == 9) {
        $('.sell-upload__box').show();
      }
    }
  });

  //ajax通信 
  $('#single__form--sell').on('submit', function(e) {
    e.preventDefault();
    let formData = new FormData(this);
    
    for (var i = 0; i < newFileCollection.length; i++ ) {
      formData.append('item[image_files][]', newFileCollection[i]);
    }

    deleteFileCollection.sort(descendingSort);
    for (var i = 0; i < deleteFileCollection.length; i++ ) {
      formData.append('item[delete_image_files][]', deleteFileCollection[i]);
    }

    if (totalFileNumber > 0) {
      formData.append('item[image_validation]', "ok");
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

    .done(function(json) {
      if (json.redirect) {
        window.location = json.redirect;
      } else {
        $('.modal__window').fadeIn("slow");
        console.log(json.id);
        $('.modal__body__link').attr('href', `/items/${json.id}`)
      }
    })

    .always(function() {
      $('#sell-submit').removeAttr('disabled')
    })
  })
});
