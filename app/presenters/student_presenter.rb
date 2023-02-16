class StudentPresenter
  include Pagy::Backend
  attr_reader :students
  attr_reader :params

  def initialize(params, students = []) 
    @students = students
  end

  def student
    Student.find_by(id: @params[:id]).decorate
  end

  def decorated_students
    @students = StudentDecorator.decorate_collection(@students)
  end
end
