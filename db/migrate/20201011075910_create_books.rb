class CreateBooks < ActiveRecord::Migration[5.2]
  def change
    create_table :books do |t|
      t.integer :customer_id
      t.string :image_url
      t.integer :person_id
      t.string :title
      t.text :caption

      t.timestamps
    end
  end
end
