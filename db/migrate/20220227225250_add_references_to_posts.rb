class AddReferencesToPosts < ActiveRecord::Migration[7.0]
  def change
    add_reference :posts, :twitter_account, null: true, foreign_key: true
  end
end
