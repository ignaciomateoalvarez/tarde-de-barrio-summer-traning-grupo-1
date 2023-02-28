class StudentPresenter
  include Pagy::Backend
  attr_reader :students, :params

  def initialize(_params, students = [])    
    @students = students.order(created_at: :desc)
  end

  def student
    Student.find_by(id: @params[:id]).decorate
  end

  def decorated_students
    @students = StudentDecorator.decorate_collection(@students)
  end
end
