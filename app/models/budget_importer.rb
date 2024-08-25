class BudgetImporter
  def self.import(municipality)
    new.send(:import_csv, municipality)
  end

  private

  def import_csv(municipality)
    return nil unless municipality.csv.attached?

    Department.where(municipality:).destroy_all

    csv_data = CSV.parse(municipality.csv.download, headers: true)

    csv_data.each do |row|
      dept   = Department.find_or_create_by(name: row['department'], municipality:)
      budget = Budget.find_or_create_by(department: dept, year: row['year'].to_i)
      LineItem.find_or_create_by(name: row['line_item'], amount: row['amount'].to_i, budget:)
    end
  end

  def draft_performant_import_csv(municipality)
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

    municipality.departments.map do |dept|
    end
  end
end
