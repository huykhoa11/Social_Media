class AddUserIdToFavorites < ActiveRecord::Migration[6.1]
  def change
    add_column :favorites, :user_id, :string
    add_column :favorites, :integer, :string
  end
end
