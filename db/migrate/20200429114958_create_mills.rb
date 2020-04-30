class CreateMills < ActiveRecord::Migration[6.0]
  def change
    create_table :mills do |t|
      t.string :tool_number
      t.string :holder
      t.string :sub_holder
      t.string :tool_description
      t.string :flutes
      t.string :diamater
      t.string :insert
      t.string :protrusion
      t.string :coolant
      t.integer :user_id

      t.timestamps
    end
  end
end
