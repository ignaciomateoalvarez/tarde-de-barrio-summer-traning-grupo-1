class StudentsController < ApplicationController
  def index
    @presenter = StudentPresenter.new(params)
    @pagy, @students = @presenter.paginate
  end

  def show
    @student = StudentPresenter.new(params).student
  end

  private

  def student_params
    params.require(:student).permit(:name, :lastname, :birth, :address, :school_level, :goes_to_school)
  end
end
