class RoomsController < ApplicationController
  def index
    @rooms = Room.all
  end

  def new
    @room = Room.new
    #ユーザーと関連づけ
    @user = User.find(current_user.id)
  end
  
  def create
    @room = Room.new(room_params)
    @room.user_id = current_user.id
    if @room.save
      flash[:notice] = "部屋を登録しました"
      redirect_to :rooms
    else
      flash[:warning] = "登録に失敗しました！！"
      @room = Room.new
      #ユーザーと関連づけ
      @user = User.find(current_user.id)
      render new_room_path
    end
  end

  def own
    @rooms = Room.where(user_id: current_user.id)
  end
  
  def show
    @reservation = Reservation.new
    @room= Room.find(params[:id])
    @user = User.find(current_user.id)
  end
  
  def edit
  end
  
  def update
  end

  def destroy
  end

  private

  def room_params
    params.require(:room).permit(:name, :detail, :address, :charge, :image, :user_id)
  end
end
