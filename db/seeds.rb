# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

MuniType::TYPES.each do |type|
  MuniType.find_or_create_by!(name: type)
end

MuniStatus::STATUSES.each do |status|
  MuniStatus.find_or_create_by!(name: status)
end

if Rails.env.development?
  def percent(part, total)
    (part.to_f / total * 100).round(1)
  end

  def display_progress(total, current, verbose: false)
    warn "total: #{total} | current: #{current} | percent: #{percent(current, total)}" if verbose
    warn "   #{percent(current, total)}%" if (current % 10).zero?
  end

  warn 'GENERATING DEVELOPMENT SEED DATA'
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
  num_counties = County.count
  County.find_each.with_index do |county, i|
    display_progress(num_counties, i)
    10.times do |j|
      City.find_or_create_by!(
        name: "City_#{j}",
        county:,
        status: MuniStatus::LIVE
      )
    end
  end

  def build_departments(muni_class, display_progress: false)
    warn "-#{muni_class.name.upcase}"
    num_munis = muni_class.count
    muni_class.find_each.with_index do |muni, i|
      display_progress(num_munis, i) if display_progress
      10.times do |j|
        Department.find_or_create_by!(
          name: "#{muni_class.name}_dept_#{j}",
          municipality: muni
        )
      end
    end
  end

  warn 'BUILDING DEPARTMENTS'
  build_departments Federal
  build_departments State
  build_departments County, display_progress: true
  build_departments City, display_progress: true

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
