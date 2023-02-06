class User < ApplicationRecord
  authenticates_with_sorcery!

  validates :first_name, presence: true, format: { with: /\A[a-zA-Z\ñÑ\u00C0-\u017F\']+[\s?[a-zA-Z\ñÑ\u00C0-\u017F\']*]*\z/ }
  validates :last_name, presence: true, format: { with: /\A[a-zA-Z\ñÑ\u00C0-\u017F\']+[\s?[a-zA-Z\ñÑ\u00C0-\u017F\']*]*\z/ }
  validates :email, presence: true, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :password, presence: true
end
