class StudentDecorator < Draper::Decorator
  delegate_all

  def status_school
    if student.goes_to_school
      'si'
    else
      'no'
    end
  end
  
  def full_name
    "#{student.name} #{student.lastname}"
  end

end
