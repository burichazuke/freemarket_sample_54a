module MypageHelper

  def set_item_status(status)
    if status == 0
      tag.div "出品中", class: "mypage__content__tab-content__item-list__body__detail__status"
    elsif status == 1
      tag.div "取引中", class: "mypage__content__tab-content__item-list__body__detail__status mypage__content__tab-content__item-list__body__detail__status--red"
    elsif status == 2
      tag.div "取引完了", class: "mypage__content__tab-content__item-list__body__detail__status mypage__content__tab-content__item-list__body__detail__status--gray"
    end
  end

end
