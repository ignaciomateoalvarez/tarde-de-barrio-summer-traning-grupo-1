class Comment < ApplicationRecord
  authenticates_with_sorcery!

  belongs_to :student
  belongs_to :user

  validates :body, presence: true, length: { maximum: 500 }
end
