class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.string :name,               null:false
      t.text :description,          null:false
      t.string :size
      t.string :condition,          null:false
      t.string :shipping_fee,       null:false
      t.string :shipping_method,    null:false
      t.string :prefecture,         null:false
      t.string :shipping_date,      null:false
      t.integer :price,             null:false
      t.integer :profit,            null:false
      t.integer :status,            default: 0, null:false, limit: 2


      t.timestamps
    end
  end
end
