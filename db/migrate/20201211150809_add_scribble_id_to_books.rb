class AddScribbleIdToBooks < ActiveRecord::Migration[5.2]
  def change
    add_column :books, :scribble_id, :string
  end
end
