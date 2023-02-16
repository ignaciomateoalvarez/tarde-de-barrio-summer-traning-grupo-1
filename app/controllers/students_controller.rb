class StudentsController < ApplicationController
  def index
    @pagy, @students = pagy(Student.all)
    @presenter = StudentPresenter.new(params, @students)
  end

  def show
    @student = Student.find(params[:id])
    # @student = StudentPresenter.new(params).student
  end

  def create
    @student = Student.new(student_params)
    if @student.save
      redirect_to students_path, notice: t('.notice')
    else
      redirect_to students_path, warning: t('.warning')
    end
  end

  def new_student; end

  def edit; end

  private

  def student_params
    params.require(:student).permit(:id, :name, :lastname, :birth, :address, :school_level, :goes_to_school)
  end
end
