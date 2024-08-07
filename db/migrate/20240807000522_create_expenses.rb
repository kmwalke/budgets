class CreateExpenses < ActiveRecord::Migration[7.1]
  def change
    create_table :expenses do |t|
      t.integer :year, null: false
      t.integer :amount, null: false

      t.timestamps
    end
  end
end
