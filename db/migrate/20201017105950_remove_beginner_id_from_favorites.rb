class RemoveBeginnerIdFromFavorites < ActiveRecord::Migration[5.2]
  def change
    remove_column :favorites, :beginner_id, :string
  end
end
