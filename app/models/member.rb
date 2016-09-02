class Member < ApplicationRecord
  has_many :attendances
  has_many :schools, through: :attendances
  accepts_nested_attributes_for :attendances

  validates :name, length: { minimum: 1 }, presence: true
  validates :email, length: { minimum: 1 }, presence: true, uniqueness: true
  validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i

end
