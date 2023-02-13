class StudentsController < ApplicationController
    def index
      @student = Student.all
      @age = (Time.now.year)
    end

end