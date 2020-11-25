class AddTagIdToPeople < ActiveRecord::Migration[5.2]
  def change
    add_column :people, :tag_id, :integer
  end
end
