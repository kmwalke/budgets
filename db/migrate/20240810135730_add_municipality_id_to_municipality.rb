class AddMunicipalityIdToMunicipality < ActiveRecord::Migration[7.2]
  def change
    add_column :municipalities, :municipality_id, :integer
  end
end
