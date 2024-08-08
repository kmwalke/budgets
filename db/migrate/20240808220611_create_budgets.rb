class CreateBudgets < ActiveRecord::Migration[7.1]
  def change
    create_table :budgets do |t|
      t.integer :year
      t.integer :department_id

      t.timestamps
    end
  end
end
