class CreatePeople < ActiveRecord::Migration[5.2]
  def change
    create_table :people do |t|
      t.string :name
      t.string :person_image_id
      t.string :name_kana
      t.string :country
      t.text :introduction
      t.integer :birth
      t.integer :death
      t.integer :customer_id

      t.timestamps
    end
  end
end
