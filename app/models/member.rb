class Member < ApplicationRecord
  has_many :attendances
  has_many :schools, through: :attendances
end
