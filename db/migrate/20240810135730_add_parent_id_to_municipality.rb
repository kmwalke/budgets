class AddParentIdToMunicipality < ActiveRecord::Migration[7.2]
  def change
    add_column :municipalities, :parent_id, :integer
  end
end
