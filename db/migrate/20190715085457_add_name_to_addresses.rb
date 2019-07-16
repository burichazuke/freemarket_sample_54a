class AddNameToAddresses < ActiveRecord::Migration[5.2]
  def change
    add_column :addresses, :last_name, :string, null:false, after: :id
    add_column :addresses, :first_name, :string, null:false, after: :last_name
    add_column :addresses, :last_name_kana, :string, null:false, after: :first_name
    add_column :addresses, :first_name_kana, :string, null:false, after: :last_name_kana
    add_column :addresses, :phone, :string, after: :building
  end
end
