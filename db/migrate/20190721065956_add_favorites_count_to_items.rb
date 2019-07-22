class AddFavoritesCountToItems < ActiveRecord::Migration[5.2]
  def change
    add_column :items, :favorites_count, :integer
  end
end
