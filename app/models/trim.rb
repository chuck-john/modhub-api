# frozen_string_literal: true

class Trim < ApplicationRecord
  belongs_to :model

  has_one :make, through: :model

  validates :name, uniqueness: { scope: :model_id }

  def to_s
    name
  end
end

# == Schema Information
#
# Table name: trims
#
#  id         :bigint           not null, primary key
#  name       :string           not null
#  years      :integer          default([]), not null, is an Array
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  model_id   :bigint           not null
#
# Indexes
#
#  index_trims_on_model_id           (model_id)
#  index_trims_on_name_and_model_id  (name,model_id) UNIQUE
#
# Foreign Keys
#
#  fk_rails_...  (model_id => models.id)
#
