# == Schema Information
#
# Table name: cats
#
#  id          :integer          not null, primary key
#  birth_date  :date             not null
#  color       :string           not null
#  name        :string           not null
#  sex         :string           not null
#  description :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Cat < ApplicationRecord
  include ActionView::Helpers::DateHelper

  COLORS = %w(yellow red blue turqoise magenta opium)

  validates :color, inclusion: COLORS
  validates :sex, inclusion: %w(M F)
  validates :color, :sex, :name, :birth_date, :description, presence: true

  def age
    time_ago_in_words(birth_date)
  end
end
