class Attendance < ApplicationRecord
  belongs_to :student
  enum state: {
    present: 0,
    absent: 1,
    left: 2
  }
end
