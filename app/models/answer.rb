class Answer < ApplicationRecord
  belongs_to :comment, optional: true
  belongs_to :user
  belongs_to :post, optional: true

  validates :reply, presence: true
end
