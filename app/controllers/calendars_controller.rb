class CalendarsController < ApplicationController
  
  def create
      calendar = Calendar.new(calendar_params)
      calendar.save!
      @calendars = Calendar.where(user_id: current_user.id)
  end

  def update
      calendar = Calendar.find(params[:id])
      @calendars = Calendar.where(user_id: current_user.id)
      calendar.update(calendar_params)
  end
  
  def edit
      calendar = Calendar.find(params[:id])
      @calendars = Calendar.where(user_id: current_user.id)
  end

  def destroy
      @user = User.find(params[:id])
      calendar = Calendar.find(params[:id])
      calendar.destroy
      redirect_to user_path(@user)
  end

  private
  def calendar_params
      params.require(:calendar).permit(:title, :start, :end, :user_id, :body)
  end
end
