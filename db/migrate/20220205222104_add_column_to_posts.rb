class AddColumnToPosts < ActiveRecord::Migration[7.0]
  def change
    add_column :posts, :posted, :boolean, default: false
  end
end
