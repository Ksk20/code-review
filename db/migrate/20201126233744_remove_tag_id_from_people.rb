class RemoveTagIdFromPeople < ActiveRecord::Migration[5.2]
  def up
    remove_column :people, :tag_id
  end

  def down
  	add_column :people, :tag_id, :integer
  end
end
