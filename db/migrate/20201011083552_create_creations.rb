class CreateCreations < ActiveRecord::Migration[5.2]
  def change
    create_table :creations do |t|
      t.integer :customer_id
      t.string :image_id
      t.string :cartoon_id
      t.integer :person_id
      t.string :caption

      t.timestamps
    end
  end
end
