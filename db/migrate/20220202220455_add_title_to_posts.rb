class AddTitleToPosts < ActiveRecord::Migration[7.0]
  def change
    alter_column :posts, :title, :string
  end
end
