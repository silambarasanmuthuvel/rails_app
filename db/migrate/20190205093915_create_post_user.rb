class CreatePostUser < ActiveRecord::Migration[5.2]
  def change
    create_table :post_users, id:false do |t|
      t.references :post, foreign_key: true
      t.references :user, foreign_key: true
    end
  end
end