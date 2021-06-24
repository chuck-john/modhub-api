# frozen_string_literal: true

require 'csv'
require 'faker'

def seed_make(name)
  Make.find_or_create_by!(name: name.upcase.gsub('-', ' '))
end

def seed_mode(slug, name)
  Mode.find_or_create_by!(slug: slug) { |mode| mode.name = name.singularize.titleize }
end

def seed_model(make, mode, name)
  make.models.find_or_create_by!(name: name) { |model| model.mode = mode }
end

def seed_trim(model, year, name)
  model.trims.find_or_initialize_by(name: name || '').tap do |trim|
    trim.update! years: (trim.years << year.to_i).uniq.sort
  end
end

def seed_user(email, name)
  User.find_or_create_by!(email: email.downcase) do |user|
    user.name = name
    user.password = user.password_confirmation = 'password'
  end
end

$stdout.sync = true

10.times do
  name = Faker::Name.neutral_first_name
  seed_user("#{name}@modhub.com", name)
end

seeds = [
  { file: 'aircraft',    mode: :air   },
  { file: 'atvs',        mode: :atv   },
  { file: 'automobiles', mode: :auto  },
  { file: 'rvs',         mode: :rv    },
  { file: 'spacecraft',  mode: :space },
  { file: 'watercraft',  mode: :water }
].freeze

seeds.each do |seed|
  file = Rails.root.join("storage/#{seed[:file]}.csv")
  mode = seed_mode(seed[:mode], seed[:file])

  next unless File.exist?(file)

  CSV.foreach(file, headers: true) do |row|
    year  = row['year']
    make  = seed_make(row['make'])
    model = seed_model(make, mode, row['model'])
    trim  = seed_trim(model, year, row['trim'])

    puts "#{mode}: #{year} #{make} #{model} #{trim}".strip # rubocop:disable Rails/Output
  end
end
