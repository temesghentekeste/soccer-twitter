class AddColumnsToOpinioins < ActiveRecord::Migration[6.0]
  def change
    add_column :opinions, :upvotes, :integer, default: 0
    add_column :opinions, :downvotes, :integer, default: 0
  end
end
