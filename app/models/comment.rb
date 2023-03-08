class Comment < ApplicationRecord
  authenticates_with_sorcery!

  belongs_to :student
  belongs_to :user
  has_many :answers
  has_many :likes, dependent: :destroy
  has_many_attached :attachment
  validates :body, presence: true, length: { maximum: 500 }

  scope :highlighted, -> { where(highlight: true) }
  scope :not_highlighted, -> { where(highlight: false) }

  validate :correct_file_type

  private

  def correct_file_type
    allowed_types = %w[image/jpeg image/png application/pdf application/msword]
    attachment.each do |attachment|
      unless attachment.content_type.in?(allowed_types)
        errors.add(:attachment, :invalid_etension, allowed_extension: '.jpg, .png, .doc, .pdf', extension: attachment.content_type)
      end
    end
  end
end