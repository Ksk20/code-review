class AddAliasToPeople < ActiveRecord::Migration[5.2]
  def change
    add_column :people, :alias, :string
  end
end
