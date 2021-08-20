class CreateFavorites < ActiveRecord::Migration[6.1]
  def change
    create_table :favorites do |t|
      t.integer :user_id
      t.integer :tweet_id

      t.timestamps

      t.index :user_id
      t.index :tweet_id
      t.index :created_at
    end
  end
end
