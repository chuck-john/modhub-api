# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Vehicle, type: :model do
  fixtures :all

  let(:vehicle) { vehicles(:one).dup }

  describe 'validation errors' do
    it 'passes validation when appropriate year is present' do
      vehicle.year = vehicle.years.sample
      vehicle.validate
      expect(vehicle.errors).not_to include(:year)
    end

    it 'fails validation when year is absent' do
      vehicle.year = nil
      vehicle.validate
      expect(vehicle.errors.full_messages).to include("Year can't be blank")
    end

    it 'fails validation when year is not a number' do
      vehicle.year = 'A'
      vehicle.validate
      expect(vehicle.errors.full_messages).to include('Year is not a number')
    end

    it 'fails validation when year is outside the range' do
      vehicle.year = vehicle.years.first - 1
      vehicle.validate
      expect(vehicle.errors.full_messages).to include('Year is not included in the list')
    end
  end
end
