# frozen_string_literal: true

require 'rails_helper'

describe Mode, type: :model do
  fixtures :all

  let(:mode) { modes(:auto).dup }

  describe 'validation errors' do
    it 'fails validation when name is blank' do
      mode.name = ''
      mode.validate
      expect(mode.errors.full_messages).to include("Name can't be blank")
    end

    it 'fails validation when slug is not unique' do
      mode.validate
      expect(mode.errors.full_messages).to include('Slug has already been taken')
    end
  end
end
