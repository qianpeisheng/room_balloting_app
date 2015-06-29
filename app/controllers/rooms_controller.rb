class RoomsController < ApplicationController
    before_action :logged_in_user, only: [:index, :edit, :update]
    
  def create
      @room = Room.new(room_params)
    if @room.save
      flash[:success] = "Room created!"
      redirect_to root_url
    else
      render 'static_pages/home'
    end
  end
  
  def edit
    @room = Room.find(params[:id])
    @user = User.find(params[:id])
    #code
  end
  
  def new
    @room = Room.new
  end
    
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
  
  private

    def room_params
      params.require(:room).permit(:block, :name, :gender, :sd, :vacancy)
    end
          # Confirms the correct room.
    def correct_room
      @room = Room.find(params[:id])
    end
    
end
