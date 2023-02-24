class User < ApplicationRecord
  authenticates_with_sorcery!

  validates :first_name, presence: true, format: { with: /\A[a-zA-Z\ñÑ\u00C0-\u017F\']+[\s?[a-zA-Z\ñÑ\u00C0-\u017F\']*]*\z/ }
  validates :last_name, presence: true, format: { with: /\A[a-zA-Z\ñÑ\u00C0-\u017F\']+[\s?[a-zA-Z\ñÑ\u00C0-\u017F\']*]*\z/ }
  validates :email, presence: true, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP }, if: -> { new_record? || changes[:email] }
  validates :password, length: { minimum: 3 }, if: -> { new_record? || changes[:crypted_password] }, unless: -> { validate_password == false }
  validates :password, confirmation: true, presence: true, if: -> { new_record? || changes[:crypted_password] }, unless: -> { validate_password == false }

  attr_accessor :validate_password

  has_many :students
  has_many :comments

  def save_with_validations(validate_password: true)
    self.validate_password = validate_password
    save
  end

  enum role: [:administrador, :colaborador]
  
  validates :role, presence: true
  validates :role, inclusion: {in: ["administrador", "colaborador"]}
end
