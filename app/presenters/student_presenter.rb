class StudentPresenter
  include Pagy::Backend
  attr_reader :students, :params

  def initialize(params, students = [])
    @params = params
    @students = students
  end

  def student
    Student.find_by(id: @params[:id]).decorate
  end

  def decorated_students
    @students = StudentDecorator.decorate_collection(@students.order(created_at: :desc))
  end

  def grouped_comments
    {
      highlighted: @students.comments.highlighted.group_by { |c| c.created_at.to_date }.sort.reverse,
      not_highlighted: @students.comments.not_highlighted.group_by { |c| c.created_at.to_date }.sort.reverse
    }
  end
end
