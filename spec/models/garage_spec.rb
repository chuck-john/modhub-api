# frozen_string_literal: true

require 'rails_helper'

describe Garage, type: :model do
  fixtures :all

  let(:garage) { garages(:one).dup }

  describe 'validation errors' do
    it 'fails validation when name is blank' do
      garage.name = ''
      garage.validate
      expect(garage.errors.full_messages).to include("Name can't be blank")
    end
  end
end
