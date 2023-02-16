class StudentDecorator < Draper::Decorator
  delegate_all
  include Draper::LazyHelpers

  def status_school
    if student.goes_to_school
      t('.yes')
    else
      t('.no')
    end
  end

  def full_name
    "#{student.name} #{student.lastname}"
  end
end
