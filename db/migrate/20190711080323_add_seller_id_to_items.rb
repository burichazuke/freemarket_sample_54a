class AddSellerIdToItems < ActiveRecord::Migration[5.2]
  def change
    add_column :items, :seller_id, :integer, null:false, foreign_key: true
    add_column :items, :buyer_id, :integer, foreign_key: true
  end
end
