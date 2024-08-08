class CreateDepartments < ActiveRecord::Migration[7.1]
  def change
    create_table :departments do |t|
      t.string :name, null: false
      t.integer :municipality_id, null: false

      t.timestamps
    end
  end
end
