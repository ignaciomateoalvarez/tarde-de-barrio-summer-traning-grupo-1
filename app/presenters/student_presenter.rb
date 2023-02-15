class StudentPresenter
  include Pagy::Backend
  attr_reader :students

  def initialize(students)
    @students = students
  end

  def decorated_students
    @students = StudentDecorator.decorate_collection(@students)
  end
end
