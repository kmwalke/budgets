class CreateMunicipalities < ActiveRecord::Migration[7.1]
  def change
    create_table :municipalities do |t|
      t.string :name, null: false
      t.string :type, null: false
      t.integer :expense_id, null: false
      t.string :status, null: false

      t.timestamps
    end
  end
end
