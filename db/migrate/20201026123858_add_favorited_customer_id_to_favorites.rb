class AddFavoritedCustomerIdToFavorites < ActiveRecord::Migration[5.2]
  def change
    add_column :favorites, :favorited_customer_id, :integer
  end
end
