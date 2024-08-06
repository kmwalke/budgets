class CreateMuniTypes < ActiveRecord::Migration[7.1]
  def change
    create_table :muni_types do |t|
      t.string :name
    end
  end
end
