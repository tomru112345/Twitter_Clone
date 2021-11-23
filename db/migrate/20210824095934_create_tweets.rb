class CreateTweets < ActiveRecord::Migration[6.1]
  def change
    create_table :tweets do |t|
      t.integer :user_id
      t.string :content

      t.timestamps
      
      t.index :user_id
      t.index :created_at

      t.float :score
    end
  end
end