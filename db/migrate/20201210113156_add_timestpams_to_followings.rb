class AddTimestpamsToFollowings < ActiveRecord::Migration[6.0]
  def change
    add_column :followings, :created_at, :datetime, null: false
    add_column :followings, :updated_at, :datetime, null: false
  end
end
