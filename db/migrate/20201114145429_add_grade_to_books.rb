class AddGradeToBooks < ActiveRecord::Migration[5.2]
  def change
    add_column :books, :grade, :string
  end
end
