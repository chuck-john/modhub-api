# frozen_string_literal: true

require 'csv'

def seed_make(name)
  Make.find_or_create_by!(name: name)
end

def seed_mode(name, slug)
  Mode.find_or_create_by!(slug: slug) { |mode| mode.name = name }
end

def seed_model(name, make, mode)
  make.models.find_or_create_by!(name: name) do |model|
    model.mode = Mode.find_by!(slug: mode)
  end
end

def seed_trim(name, model, year)
  model.trims.find_or_initialize_by(name: name).tap do |trim|
    trim.update! years: (trim.years << year.to_i).uniq.sort
  end
end

$stdout.sync = true

modes = {
  air: 'Aircraft',
  atv: 'ATV',
  auto: 'Automobile',
  rv: 'RV',
  water: 'Watercraft'
}

modes.each { |slug, name| seed_mode(name, slug) }

autos = 'db/automobiles.csv'

if File.exist?(autos)
  CSV.foreach(autos, headers: true) do |row|
    make = seed_make(row['model_make_id'].upcase.gsub('-', ' '))
    model = seed_model(row['model_name'], make, :auto)
    trim = seed_trim(row['model_trim'] || '', model, row['model_year'])
    puts "#{make} #{model} #{trim}" # rubocop:disable Rails/Output
  end
end

User.find_or_create_by!(email: 'tester@modhub.com') do |user|
  user.name = 'Tester'
  user.password = user.password_confirmation = 'password'
end
