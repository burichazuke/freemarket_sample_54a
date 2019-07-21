class AddVerifiedToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :phone_number, :string
    add_column :users, :verification_code, :string
    add_column :users, :verified, :boolean, null: false, default: false
  end
end
