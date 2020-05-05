class AddMasterUserNameToLikes < ActiveRecord::Migration[6.0]
  def change
    add_column :likes, :master_user_id, :integer
  end
end
