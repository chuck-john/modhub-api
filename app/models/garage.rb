# frozen_string_literal: true

class Garage < ApplicationRecord
  belongs_to :user

  has_many :vehicles, dependent: :destroy

  validates :name, presence: true

  def to_s
    name
  end
end

# == Schema Information
#
# Table name: garages
#
#  id         :bigint           not null, primary key
#  location   :string
#  name       :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :bigint           not null
#
# Indexes
#
#  index_garages_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#
