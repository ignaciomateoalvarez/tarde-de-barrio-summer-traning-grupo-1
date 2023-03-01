class StudentPresenter
  include Pagy::Backend
  attr_reader :students, :params

  def initialize(params, students = [])    
    @params = params
    @students = students.order(created_at: :desc)
  end

  def student
    Student.find_by(id: @params[:id]).decorate
  end

  def decorated_students
    @students = StudentDecorator.decorate_collection(@students)
  end

  def comments_by_day
    @student.comments.group_by{ |c| c.created_at.to_date }.sort.reverse
  end
end

