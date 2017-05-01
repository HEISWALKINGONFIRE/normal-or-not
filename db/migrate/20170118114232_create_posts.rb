class CreatePosts < ActiveRecord::Migration[5.0]
  def change
    create_table :posts do |t|
    	t.string :title
    	t.string :tag
    	t.string :body
      t.integer :comment_id
      t.integer :upvote, default: 0
      t.integer :downvote, default:0
      t.integer :user_id

      t.timestamps
    end
  end
end
