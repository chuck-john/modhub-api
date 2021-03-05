# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Trim, type: :model do
  fixtures :all

  let(:trim) { trims(:one).dup }

  describe 'validation errors' do
    it 'fails validation when name is not unique' do
      trim.validate
      expect(trim.errors.full_messages).to include('Name has already been taken')
    end

    it 'passes validation when name is not unique but model is different' do
      trim.model = models(:two)
      trim.validate
      expect(trim.errors).not_to include(:name)
    end
  end
end
