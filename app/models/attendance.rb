class Attendance < ApplicationRecord
  belongs_to :member
  belongs_to :school

  validates :member, uniqueness: { scope: [:school] }
end
