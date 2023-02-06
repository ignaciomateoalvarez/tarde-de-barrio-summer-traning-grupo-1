class StudentsController < ApplicationController
  def index
    @presenter = UserPresenter.new(params)
    @pagy, @records = pagy(@presenter.users)
  end
end
