class Student < ApplicationRecord
  authenticates_with_sorcery!

  validates :name, presence: true, format: { with: /\A[a-zA-Z\ñÑ\u00C0-\u017F\']+[\s?[a-zA-Z\ñÑ\u00C0-\u017F\']*]*\z/ }
  validates :lastname, presence: true, format: { with: /\A[a-zA-Z\ñÑ\u00C0-\u017F\']+[\s?[a-zA-Z\ñÑ\u00C0-\u017F\']*]*\z/ }
  #validates :address, presence: true, format: { with: /\A[\s([\w\d\s]+),\s([\w\d\s]+)]*]*\z/ } #calle + numero + coma + ciudad 'calle 135, la plata'
  validates :school_level, presence: true
  validates :go_to_school, presence: true


  enum go_to_school: %i[yes no]
  enum school_level: %i[kinder-garder primary secondary]
end
