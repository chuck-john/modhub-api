# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Make, type: :model do
  fixtures :all

  let(:make) { makes(:one).dup }

  describe 'validation errors' do
    it 'fails validation when name is blank' do
      make.name = ''
      make.validate
      expect(make.errors.full_messages).to include("Name can't be blank")
    end

    it 'fails validation when name is not unique' do
      make.validate
      expect(make.errors.full_messages).to include('Name has already been taken')
    end
  end
end
