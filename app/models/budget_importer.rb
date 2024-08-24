class BudgetImporter
  def self.import(municipality)
    new.send(:import_csv, municipality)
  end

  private

  def import_csv(municipality)
    return nil unless municipality.csv.attached?

    Department.where(municipality:).delete_all

    csv_data        = CSV.parse(municipality.csv.download, headers: true)
    municipality_id = municipality.id

    Department.insert_all(
      csv_data.map do |row|
        {
          name: row['department'],
          municipality_id:
        }
      end.uniq
    )

    department_info = {}

    municipality.departments.map do |dept|
      department_info[dept.name] = dept.id
    end

    Budget.insert_all(
      csv_data.map do |row|
        {
          year: row['year'],
          department_id: department_info[row['department']]
        }
      end.uniq
    )
  end
end
