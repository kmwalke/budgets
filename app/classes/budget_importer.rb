class BudgetImporter
  attr_accessor :municipality, :municipality_id, :csv_data, :department_budget_map

  def self.import(municipality)
    new(municipality).send(:import_csv)
  end

  def initialize(municipality)
    return unless municipality&.csv&.attached?

    @municipality          = municipality
    @municipality_id       = @municipality.id
    @csv_data              = CSV.parse(@municipality.csv.download, headers: true)
    @department_budget_map = {}
  end

  private

  # TODO: confirm DB constraints as this is a raw data importer
  def import_csv
    return nil unless @municipality&.csv&.attached?

    delete_old_records

    import_departments
    map_department_ids

    import_budgets
    map_budget_ids

    import_line_items

    true
  end

  def delete_old_records
    LineItem.joins(budget: :department).where(department: { municipality_id: @municipality_id }).delete_all
    Budget.joins(:department).where(department: { municipality: }).delete_all
    Department.where(municipality:).delete_all
  end

  def import_departments
    Department.insert_all(
      @csv_data.map do |row|
        {
          name: row['department'],
          municipality_id:
        }
      end.uniq
    )
  end

  def map_department_ids
    @municipality.departments.map do |dept|
      @department_budget_map[dept.name] = {
        dept_id: dept.id
      }
    end
  end

  def import_budgets
    Budget.insert_all(
      @csv_data.map do |row|
        {
          year: row['year'],
          department_id: @department_budget_map[row['department']][:dept_id]
        }
      end.uniq
    )
  end

  def map_budget_ids
    @department_budget_map.each do |dept_name, dept_hash|
      @department_budget_map[dept_name] = {
        dept_id: dept_hash[:dept_id],
        budget_id: latest_budget_id(dept_hash[:dept_id])
      }
    end
  end

  def latest_budget_id(department_id)
    Budget.where(department_id:).order(year: :desc).first.id
  end

  def import_line_items
    LineItem.insert_all(
      @csv_data.map do |row|
        {
          amount: row['amount'],
          name: row['line_item'],
          budget_id: @department_budget_map[row['department']][:budget_id]
        }
      end
    )
  end
end
