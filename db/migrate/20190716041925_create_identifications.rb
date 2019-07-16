class CreateIdentifications < ActiveRecord::Migration[5.2]
  def change
    create_table :identifications do |t|
      t.string :postal_code
      t.string :prefecture
      t.string :municipalities
      t.string :address
      t.string :building 
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
