class CreateTwitterAccounts < ActiveRecord::Migration[7.0]
  def change
    create_table :twitter_accounts do |t|
      t.string :access_token
      t.string :access_token_secret
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
