class RoomsController < ApplicationController
    before_action :logged_in_user, only: [:index, :edit, :update]
    
  def show
    @room = Room.find(params[:id])
  end
    
  def index
    @rooms = Room.all
  end
  
  def choose
      flash[:success] = "Welcome to the Sample App!"
  end
  
  def update
      @room = Room.find(params[:id])
      @room.update_attribute( :resident, @user.name)
      flash[:success] = "Resident updated"
      redirect_to @room
  end
  
    
end
