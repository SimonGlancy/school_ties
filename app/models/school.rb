class School < ApplicationRecord
  has_many :attendances
  has_many :members, through: :attendances
  accepts_nested_attributes_for :attendances

  validates :name, uniqueness: true, length: { minimum: 1 }, presence: true

  def self.create_school_selection
    schools = School.all.map{|s| [s.name, s.id]}
    schools << "N/A"
  end
end
