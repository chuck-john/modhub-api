# frozen_string_literal: true

class Make < ApplicationRecord
  include MakeDoc

  has_many :models, dependent: :destroy

  validates :name, presence: true, uniqueness: { case_sensitive: false }

  def to_s
    name
  end
end

# == Schema Information
#
# Table name: makes
#
#  id         :bigint           not null, primary key
#  name       :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_makes_on_name  (name) UNIQUE
#
