class StudentsController < ApplicationController

    def index
      @pagy, @students = pagy(Student.all.decorate)
    end

end