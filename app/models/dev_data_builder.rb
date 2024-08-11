class DevDataBuilder

  def self.build_data
    self.new.send(:gen_data)
  end

  private

  def gen_data
    warn 'GENERATING DEVELOPMENT SEED DATA'
    build_municipalities
    build_departments
    build_budgets
  end

  def build_municipalities
    federal = Federal.find_or_create_by!(name: 'federal', status: MuniStatus::LIVE)

    warn 'BUILDING STATES'
    10.times do |i|
      State.find_or_create_by!(name: "State_#{i}", federal:, status: MuniStatus::LIVE)
    end

    warn 'BUILDING COUNTIES'
    State.find_each do |state|
      10.times do |j|
        County.find_or_create_by!(
          name: "County_#{j}",
          state:,
          status: MuniStatus::LIVE
        )
      end
    end

    warn 'BUILDING CITIES'
    County.find_each.with_index do |county, i|
      10.times do |j|
        City.find_or_create_by!(
          name: "City_#{j}",
          county:,
          status: MuniStatus::LIVE
        )
      end
    end
  end

  def build_departments
    warn 'BUILDING DEPARTMENTS'
    Department.delete_all
    generate_departments Federal
    generate_departments State
    generate_departments County
    generate_departments City, display_progress: true
  end

  def generate_departments(muni_class, display_progress: false)
    warn "-#{muni_class.name.upcase}"
    num_munis = muni_class.count
    muni_class.find_each.with_index do |muni, i|
      display_progress(num_munis, i) if display_progress
      Department.insert_all(
        10.times.map do |j|
          {
            name: "#{muni_class.name}_dept_#{j}",
            municipality_id: muni.id
          }
        end
      )
    end
  end

  def build_budgets
    warn 'BUILDING BUDGETS'
    num_depts = Department.count
    LineItem.delete_all

    Department.find_each.with_index do |dept, i|
      display_progress(num_depts, i)

      budget = Budget.find_or_create_by!(
        department: dept,
        year: 2024
      )

      LineItem.insert_all(
        10.times.map do |j|
          {
            budget_id: budget.id,
            name: "budget_line_item_#{j}",
            amount: rand(1000..100_000)
          }
        end
      )
    end

    warn 'SEED DATA COMPLETE'
  end

  def percent(part, total)
    (part.to_f / total * 100).round(1)
  end

  def display_progress(total, current, verbose: false)
    warn "total: #{total} | current: #{current} | percent: #{percent(current, total)}" if verbose
    warn "   #{percent(current, total)}%" if (current % 100).zero?
  end
end
