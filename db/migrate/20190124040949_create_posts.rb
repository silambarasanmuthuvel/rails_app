class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.string :title
      t.text :body
      t.integer :user_id
      t.references :topic, foreign_key: true

      t.timestamps
    end
  end
end
