class CreateMuniStatuses < ActiveRecord::Migration[7.1]
  def change
    create_table :muni_statuses, id: false do |t|
      t.string :name, null: false, index: { unique: true, name: 'unique_statuses' }
    end
  end
end
