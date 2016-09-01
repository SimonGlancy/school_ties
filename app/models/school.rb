class School < ApplicationRecord
  has_many :attendances
  has_many :members, through: :attendances

  validates :name, uniqueness: true, length: { minimum: 1 }, presence: true 
end
