class DataBuilder
  def self.build_data
    new.send(:gen_data)
  end

  def self.build_dev_data
    new.send(:gen_dev_data)
  end

  private

  def gen_data
    warn 'GENERATING REQUIRED BOOTSTRAP DATA'
    MuniType::TYPES.each do |type|
      MuniType.find_or_create_by!(name: type)
    end

    MuniStatus::STATUSES.each do |status|
      MuniStatus.find_or_create_by!(name: status)
    end

    Federal.find_or_create_by!(name: 'USA', status: MuniStatus::LIVE)
  end

  def gen_dev_data
    warn 'GENERATING DEVELOPMENT SEED DATA'
    build_municipalities
    build_departments
    build_budgets
    build_users
    warn 'SEED DATA COMPLETE'
  end

  def build_municipalities
    warn 'BUILDING MUNICIPALITIES'
    warn '-STATES'
    generate_states
    warn '-COUNTIES'
    generate_counties
    warn '-CITIES'
    generate_cities
  end

  def build_departments
    warn 'BUILDING DEPARTMENTS'
    Department.delete_all
    warn '-FEDERAL'
    generate_departments Federal
    warn '-STATES'
    generate_departments State
    warn '-COUNTIES'
    generate_departments County
    warn '-CITIES'
    generate_departments City, display_progress: true
  end

  def generate_states
    10.times do |i|
      State.find_or_create_by!(name: "State_#{i}", federal: Federal.first, status: MuniStatus::LIVE)
    end
  end

  def generate_counties
    State.find_each do |state|
      10.times do |j|
        County.find_or_create_by!(
          name: "County_#{j}",
          state:,
          status: MuniStatus::LIVE
        )
      end
    end
  end

  def generate_cities
    City.delete_all
    County.find_each do |county|
      City.insert_all(
        10.times.map do |j|
          {
            name: "City_#{j}",
            municipality_id: county.id,
            status: MuniStatus::LIVE
          }
        end
      )
    end
  end

  def generate_departments(muni_class, display_progress: false)
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
  end

  def build_users
    warn 'BUILDING USERS'
    User.delete_all
    u          = User.new
    u.name     = 'Kent'
    u.email    = 'kmwalke@gmail.com'
    u.password = 'password'
    u.save
  end

  def display_progress(total, current, verbose: false)
    warn "total: #{total} | current: #{current} | percent: #{percent(current, total)}" if verbose
    warn "   #{percent(current, total)}%" if (current % 100).zero?
  end

  def percent(part, total)
    (part.to_f / total * 100).round
  end
end
