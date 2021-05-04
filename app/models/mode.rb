# frozen_string_literal: true

class Mode < ApplicationRecord
  has_many :models, dependent: :destroy

  with_options presence: true do
    validates :name
    validates :slug, uniqueness: true
  end

  def to_s
    name
  end
end

# == Schema Information
#
# Table name: modes
#
#  id         :bigint           not null, primary key
#  name       :string           not null
#  slug       :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_modes_on_slug  (slug) UNIQUE
#
