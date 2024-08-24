class BudgetImporter
  def self.import(municipality)
    new.send(:import_csv, municipality)
  end

  private

  def import_csv(municipality)
    return nil unless municipality.csv.attached?

    Department.where(municipality:).delete_all

    departments     = []
    municipality_id = municipality.id

    CSV.parse(municipality.csv.download, headers: true) do |row|
      departments << {
        name: row['department'],
        municipality_id:
      }
    end

    Department.insert_all(departments.uniq)
  end
end
