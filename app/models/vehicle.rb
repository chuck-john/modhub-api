# frozen_string_literal: true

class Vehicle < ApplicationRecord
  delegate :years, to: :trim

  belongs_to :garage
  belongs_to :trim

  has_one :model, through: :trim
  has_one :make, through: :model
  has_one :user, through: :garage

  validates :year, presence: true, numericality: { only_integer: true },
                   inclusion: { in: :years }

  def to_s
    "#{year} #{make} #{model} #{trim}"
  end
end

# == Schema Information
#
# Table name: vehicles
#
#  id         :bigint           not null, primary key
#  year       :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  garage_id  :bigint           not null
#  trim_id    :bigint           not null
#
# Indexes
#
#  index_vehicles_on_garage_id  (garage_id)
#  index_vehicles_on_trim_id    (trim_id)
#
# Foreign Keys
#
#  fk_rails_...  (garage_id => garages.id)
#  fk_rails_...  (trim_id => trims.id)
#
