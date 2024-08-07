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
  10.times do |i|
    state = State.find_or_create_by!(name: "State_#{i}", status: MuniStatus::LIVE)

    10.times do |j|
      county = County.find_or_create_by!(
        name: "County_#{j}",
        status: MuniStatus::LIVE
      )
    end
  end
end
