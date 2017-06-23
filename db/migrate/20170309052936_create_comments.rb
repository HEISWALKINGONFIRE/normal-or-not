class CreateComments < ActiveRecord::Migration[5.0]
  def change
    create_table :comments do |t|
      t.text :body
      t.integer :upvote, default: 0
      t.integer :downvote, default: 0
      t.integer :user_id
      t.integer :post_id
      # add_column :comments, :upvote :integer default: 0, :user_id
      # add_column :comments, :downvote :integer default: 0, :user_id
      t.timestamps
    end
  end
end
