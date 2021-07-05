# frozen_string_literal: true

class Model < ApplicationRecord
  include ModelDoc

  belongs_to :make
  belongs_to :mode

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
#  name       :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  make_id    :bigint           not null
#  mode_id    :bigint           not null
#
# Indexes
#
#  index_models_on_make_id           (make_id)
#  index_models_on_mode_id           (mode_id)
#  index_models_on_name_and_make_id  (name,make_id) UNIQUE
#
# Foreign Keys
#
#  fk_rails_...  (make_id => makes.id)
#  fk_rails_...  (mode_id => modes.id)
#
