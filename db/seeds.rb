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
  County.find_each do |county|
    10.times do |k|
      City.find_or_create_by!(
        name: "City_#{k}",
        county:,
        status: MuniStatus::LIVE
      )
    end
  end
end
