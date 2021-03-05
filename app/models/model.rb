# frozen_string_literal: true

class Model < ApplicationRecord
  enum kind: {
    air: 'Aircraft',
    atv: 'ATV',
    auto: 'Automobile',
    rv: 'RV',
    water: 'Watercraft'
  }

  belongs_to :make

  has_many :trims, dependent: :destroy

  validates :name, presence: true, uniqueness: { scope: :make_id }

  def to_s
    name
  end

  def years
    trims.pluck(:years).flatten.uniq.sort
  end
end

# == Schema Information
#
# Table name: models
#
#  id         :bigint           not null, primary key
#  kind       :string           not null
#  name       :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  make_id    :bigint           not null
#
# Indexes
#
#  index_models_on_make_id           (make_id)
#  index_models_on_name_and_make_id  (name,make_id) UNIQUE
#
# Foreign Keys
#
#  fk_rails_...  (make_id => makes.id)
#
