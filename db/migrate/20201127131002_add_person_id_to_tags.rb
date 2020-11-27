class AddPersonIdToTags < ActiveRecord::Migration[5.2]
  def change
    add_column :tags, :person_id, :integer
  end
end
