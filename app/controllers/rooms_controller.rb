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
      
    @rooms = Room.all.sort_by{|room| [room.block, room.name]}
    @b2 = Room.where(:block =>2 ).all.sort_by{|room| [room.block, room.name]}
    @b3 = Room.where(:block =>3 ).all.sort_by{|room| [room.block, room.name]}
    @b4 = Room.where(:block =>4 ).all.sort_by{|room| [room.block, room.name]}
    @b5 = Room.where(:block =>5 ).all.sort_by{|room| [room.block, room.name]}
    @b6 = Room.where(:block =>6 ).all.sort_by{|room| [room.block, room.name]}
  end
  
  
  def choose
      @room = Room.find(params[:id])
      @room.update_attribute(:resident, current_user.name)
      flash[:success] = "Successful!"
      redirect_to root
  end
  
  def update
      @room = Room.find(params[:id])
      if @room.update_attributes(room_params)
        flash[:success] = "Room updated"
        redirect_to @room
      else
          render 'edit'
      end
  end
  
  def destroy
    if correct_room != nil  
    correct_room.destroy
    flash[:success] = "Room deleted"
    redirect_to root_path
else
end 
  end
  
  
  private

    def room_params
      params.require(:room).permit(:block, :name, :gender, :sd, :vacancy, :resident)
    end
          # Confirms the correct room.
    def correct_room
      @room = Room.find(params[:id])
    end
    
end
