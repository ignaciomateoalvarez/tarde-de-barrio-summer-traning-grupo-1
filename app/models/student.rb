class Student < ApplicationRecord
  authenticates_with_sorcery!

  validates :name, presence: true, format: { with: /\A[a-zA-Z\ñÑ\u00C0-\u017F\']+[\s?[a-zA-Z\ñÑ\u00C0-\u017F\']*]*\z/ }
  validates :lastname, presence: true, format: { with: /\A[a-zA-Z\ñÑ\u00C0-\u017F\']+[\s?[a-zA-Z\ñÑ\u00C0-\u017F\']*]*\z/ }
  validates :address, presence: true
  validates :school_level, presence: true

  def calculate_age
    Time.now.year - birth.year
  end

  enum school_level: { kinder_garder: 0, primary: 1, secondary: 2 }
end
