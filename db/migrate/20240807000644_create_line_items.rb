class CreateLineItems < ActiveRecord::Migration[7.1]
  def change
    create_table :line_items do |t|
      t.string :name, null: false
      t.integer :department_id, null: false
      t.integer :expense_id, null: false

      t.timestamps
    end
  end
end
