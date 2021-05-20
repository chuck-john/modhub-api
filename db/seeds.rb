# frozen_string_literal: true

require 'csv'

def seed_make(name)
  Make.find_or_create_by!(name: name)
end

def seed_mode(slug, name)
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

def seed_user(email, name)
  User.find_or_create_by!(email: email) do |user|
    user.name = name
    user.password = user.password_confirmation = 'password'
  end
end

$stdout.sync = true

20.times { |index| seed_user "user-#{index}@modhub.com", "User #{index}" }

modes = [
  { slug: :air,   name: 'Aircraft'   },
  { slug: :atv,   name: 'ATV'        },
  { slug: :auto,  name: 'Automobile' },
  { slug: :rv,    name: 'RV'         },
  { slug: :water, name: 'Watercraft' }
]

modes.each do |mode|
  seed_mode mode[:slug], mode[:name]

  case mode[:slug]
  when :auto
    autos = Rails.root.join('storage/automobiles.csv')
    next unless File.exist?(autos)

    CSV.foreach(autos, headers: true) do |row|
      make = seed_make row['model_make_id'].upcase.gsub('-', ' ')
      model = seed_model row['model_name'], make, :auto
      trim = seed_trim row['model_trim'] || '', model, row['model_year']
      puts "#{make} #{model} #{trim}" # rubocop:disable Rails/Output
    end
  else
    puts "No data found for transportation mode: #{mode[:name]}" # rubocop:disable Rails/Output
  end
end
