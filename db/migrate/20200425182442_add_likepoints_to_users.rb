class AddLikepointsToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :likepoints, :integer
  end
end
