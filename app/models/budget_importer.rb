class BudgetImporter
  def self.import(municipality)
    new.send(:import_csv, municipality)
  end

  private

  def import_csv(municipality)
    return nil unless municipality.csv.attached?

    Department.where(municipality:).delete_all

    municipality_id = municipality.id

    Department.insert_all(
      CSV.parse(municipality.csv.download, headers: true).map do |row|
        {
          name: row['department'],
          municipality_id:
        }
      end.uniq
    )
  end
end
