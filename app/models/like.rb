class Like < ApplicationRecord
  belongs_to :comment
  belongs_to :user
  belongs_to :publication

  validates :user_id, uniqueness: { scope: %i[comment_id user_id] }
end
