# frozen_string_literal: true

require 'csv'

def seed_make(name)
  Make.find_or_create_by!(name: name)
end

def seed_model(make, name, kind)
  make.models.find_or_create_by!(name: name, kind: kind)
end

def seed_trim(model, name, year)
  model.trims.find_or_initialize_by(name: name).tap do |trim|
    trim.update! years: (trim.years << year.to_i).uniq.sort
  end
end

$stdout.sync = true

autos = '../automobiles.csv'

if File.exist?(autos)
  CSV.foreach(autos, headers: true) do |row|
    make = seed_make(row['model_make_id'].upcase.gsub('-', ' '))
    model = seed_model(make, row['model_name'], :auto)
    trim = seed_trim(model, row['model_trim'] || '', row['model_year'])
    puts "#{make} #{model} #{trim}" # rubocop:disable Rails/Output
  end
end

User.create! do |user|
  user.name = 'Adam Admin'
  user.email = 'admin@modhub.com'
  user.password = user.password_confirmation = 'password'
end
