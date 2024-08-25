class BudgetImporter
  def self.import(municipality)
    new.send(:import_csv, municipality)
  end

  private

  # TODO: refactor for readability
  # TODO: Performance pass
  # TODO: setup DB constraints as this is a raw data importer
  def import_csv(municipality)
    return nil unless municipality.csv.attached?

    LineItem.joins(budget: :department).where(department: { municipality_id: municipality.id }).delete_all
    Budget.joins(:department).where(department: { municipality: }).delete_all
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
      department_info[dept.name] = {
        dept_id: dept.id
      }
    end

    Budget.insert_all(
      csv_data.map do |row|
        {
          year: row['year'],
          department_id: department_info[row['department']][:dept_id]
        }
      end.uniq
    )

    department_info.each do |dept_name, dept_hash|
      department_info[dept_name] = {
        dept_id: dept_hash[:dept_id],
        budget_id: Budget.where(department_id: dept_hash[:dept_id]).order(year: :desc).first.id
      }
    end

    LineItem.insert_all(
      csv_data.map do |row|
        {
          amount: row['amount'],
          name: row['line_item'],
          budget_id: department_info[row['department']][:budget_id]
        }
      end
    )

    true
  end
end
