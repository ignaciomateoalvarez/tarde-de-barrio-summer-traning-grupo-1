class StudentsController < ApplicationController
  before_action :set_student, only: [:show, :edit, :update, :destroy, :delete_modal]

  def index
    @pagy, @students = pagy(Student.all)
    @presenter = StudentPresenter.new(params, @students)
  end

  def show; end

  def create
    @student = Student.new(student_params.merge({ user: current_user }))
    if @student.save
      redirect_to students_path, notice: t('.notice')
    else
      redirect_to new_student_path, warning: t('.warning')
    end
  end

  def edit
    authorize @student
  end

  def update
    authorize @student
    if @student.update(student_params)
      redirect_to students_path
    else
      redirect_to edit_student_path
    end
  end

  def new; end

  def destroy
    if @student.destroy
      redirect_to students_path, notice: t('.notice')
    else
      redirect_to students_path, warning: t('.warning')
    end
  end

  def delete_modal; end

  private

  def student_params
    params.require(:student).permit(:name, :lastname, :birth, :address, :school_level, :goes_to_school)
  end

  def set_student
    @student = Student.find(params[:id])
  end
end
