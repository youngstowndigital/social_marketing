class AddTimezoneToPosts < ActiveRecord::Migration[7.0]
  def change
    add_column :posts, :timezone, :string
  end
end
