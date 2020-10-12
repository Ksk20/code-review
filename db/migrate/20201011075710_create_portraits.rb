class CreatePortraits < ActiveRecord::Migration[5.2]
  def change
    create_table :portraits do |t|
      t.integer :customer_id
      t.string :image_id
      t.integer :person_id

      t.timestamps
    end
  end
end
