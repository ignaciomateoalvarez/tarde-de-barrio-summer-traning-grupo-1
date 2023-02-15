class StudentPresenter
  include Pagy::Backend
  attr_reader :students
  attr_reader :params

  # su initialize deberia recibir los params del controller tambien asi que con un simple cambio quedaria
  def initialize(params, students = []) # quizas es medio chancho... pero le doy un default value a students asi pueden usar el presenter en el show
    @params = params
    @students = students
  end

  def student
    Student.find_by(id: @params[:id]).decorate #no estoy seguro si era asi el metodo que tenian pero era algo similar
  end

  def decorated_students
    @students = StudentDecorator.decorate_collection(@students)
  end
end
