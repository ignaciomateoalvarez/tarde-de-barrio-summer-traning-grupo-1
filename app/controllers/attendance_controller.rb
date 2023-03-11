class AttendanceController < ApplicationController

  def create_or_update
    @attendance = Attendance.find_by(student_id: params[:student_id], date: Date.today)
    if @attendance
      @attendance.update(attendance_params)
    else
      @attendance = Attendance.new(attendance_params)
      @attendance.save
    end
  end

  private

  def attendance_params
    params.require(:attendance).permit(:state, :date, :student_id).merge(student_id: params[:student_id])
  end
end