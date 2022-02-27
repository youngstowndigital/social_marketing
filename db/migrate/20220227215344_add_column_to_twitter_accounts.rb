class AddColumnToTwitterAccounts < ActiveRecord::Migration[7.0]
  def change
    add_column :twitter_accounts, :name, :string
  end
end
