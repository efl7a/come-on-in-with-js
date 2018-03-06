class AttendeesController < ApplicationController
  def create
    @attendee = Attendee.new(user_id: current_user.id, study_session_id: params[:session_id])
    authorize @attendee
    if @attendee.save
      redirect_to user_study_sessions_path(current_user)
    else
      flash[:alert] = "Could not complete your request"
      render '/welcome/index'
    end
  end

  def destroy
    @attendee = Attendee.find(params[:id])
    authorize @attendee
    if @attendee.destroy
      redirect_to user_study_sessions_path(current_user)
    else
      flash[:alert] = "Could not delete this attendance record."
      render '/welcome/index'
    end
  end
end
