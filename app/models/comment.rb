class Comment < ApplicationRecord
  belongs_to :student
  belongs_to :user

  def self.chronological
    self.order("created_at ASC")
  end
end
