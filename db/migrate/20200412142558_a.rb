class A < ActiveRecord::Migration[6.0]
  def change
    remove_column :users, :provider, :string
    remove_column :users, :uid, :string
    remove_column :users, :username, :string
    remove_column :users, :name, :string
    remove_column :users, :image_name, :string
  end
end
