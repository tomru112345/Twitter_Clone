class AddNameAndScreenNameAndBioToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :name, :string
    add_column :users, :screen_name, :string
    add_column :users, :bio, :string
  end
end
