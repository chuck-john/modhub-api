# frozen_string_literal: true

require 'csv'

def seed_make(row)
  Make.find_or_create_by!(name: row['model_make_id'].upcase.gsub('-', ' '))
end

def seed_model(row, make)
  make.models.find_or_create_by!(name: row['model_name'])
end

def seed_trim(row, model)
  model.trims.find_or_initialize_by(name: row['model_trim'] || '').tap do |trim|
    trim.update!(years: (trim.years << row['model_year'].to_i).uniq.sort)
  end
end

$stdout.sync = true

CSV.foreach('db/cars.csv', headers: true) do |row|
  make = seed_make(row)
  model = seed_model(row, make)
  trim = seed_trim(row, model)
  puts "#{make} #{model} #{trim}" # rubocop:disable Rails/Output
end

User.create! do |user|
  user.name = 'Adam Admin'
  user.email = 'admin@modhub.com'
  user.password = user.password_confirmation = 'password'
end
