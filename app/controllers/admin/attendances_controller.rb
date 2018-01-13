class Admin::AttendancesController < Admin::ApplicationController
  def index
    @attendances = Attendance.order(user_id: :desc)
  end
end
