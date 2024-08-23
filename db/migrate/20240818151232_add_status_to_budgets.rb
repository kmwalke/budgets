class AddStatusToBudgets < ActiveRecord::Migration[7.2]
  def change
    add_column :budgets, :status, :string, null: false, default: MuniStatus::DRAFT

    add_foreign_key :budgets, :muni_statuses, column: :status, primary_key: :name
    add_foreign_key :municipalities, :muni_statuses, column: :status, primary_key: :name
    add_foreign_key :municipalities, :muni_types, column: :type, primary_key: :name
  end
end
