class Answer < ApplicationRecord
  belongs_to :comment
  belongs_to :user
  belongs_to :publication

  validates :reply, presence: true
end
