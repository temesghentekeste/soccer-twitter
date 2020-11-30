class CreateOpinions < ActiveRecord::Migration[6.0]
  def change
    create_table :opinions do |t|
      t.references :author, null: false, foreign_key: { to_table: :users }
      t.text :text
      t.timestamps
    end
  end
end
