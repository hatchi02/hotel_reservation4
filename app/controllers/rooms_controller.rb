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
    @room = Room.find(params[:id])
    @user = User.find(current_user.id)
  end
  
  def update
    @room = Room.find(params[:id])
    @room.update(room_params)
    flash[:notice] = "施設を編集しました"
    redirect_to "/rooms/own"
  end

  def destroy
    @room = Room.find(params[:id])
    @room.destroy
    flash[:notice] = "施設を削除しました"
    redirect_to "/rooms/own"
  end

  private

  def room_params
    params.require(:room).permit(:name, :detail, :address, :charge, :image, :user_id)
  end
end
