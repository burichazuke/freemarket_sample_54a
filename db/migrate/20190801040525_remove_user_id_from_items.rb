class RemoveUserIdFromItems < ActiveRecord::Migration[5.2]
  def change
    remove_column :items, :seller_id, :string, null:false, foreign_key: true
    remove_column :items, :buyer_id, :string, foreign_key: true
  end
end
