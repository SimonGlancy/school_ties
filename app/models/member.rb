class Member < ApplicationRecord
  has_many :attendances
  has_many :schools, through: :attendances

  validates :name, length: { minimum: 1 }, presence: true
  validates :email, length: { minimum: 1 }, presence: true
end
