class CreateComments < ActiveRecord::Migration[5.0]
  def change
    create_table :comments do |t|
      t.text :body
      t.integer :upvote, default: 0
      t.integer :downvote, default: 0
      t.integer :user_id
      t.integer :post_id
      t.timestamps
    end
  end
end
