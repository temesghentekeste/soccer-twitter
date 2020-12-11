class CreatVotes < ActiveRecord::Migration[6.0]
  def change
    create_table :votes do |t|
      t.references :user
      t.references :opinion
      t.boolean :upvote
      t.timestamps
    end
  end
end
