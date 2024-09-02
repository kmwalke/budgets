class ChangeLineItemAmountToBigint < ActiveRecord::Migration[7.2]
  def change
    change_column :line_items, :amount, :bigint
  end
end
