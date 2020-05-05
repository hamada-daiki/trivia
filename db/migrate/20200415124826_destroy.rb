class Destroy < ActiveRecord::Migration[6.0]
  def change
    drop_table :Likes
  end
end
