class AttendanceController < ApplicationController

  def create_or_update
    @attendance = Attendance.find_by(student_id: params[:student_id], date: Date.today)
    if @attendance
      @attendance.update(attendance_params)
    else
      @attendance = Attendance.create(attendance_params)
    end
  end

  private

  def attendance_params
    params.require(:attendance).permit(:state, :date).merge(student_id: params[:student_id])
  end

end