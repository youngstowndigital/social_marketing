class ChangeScheduleColumnPosts < ActiveRecord::Migration[7.0]
  def change
    change_column :posts, :schedule, :datetime
  end
end
