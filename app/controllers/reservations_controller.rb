class ReservationsController < ApplicationController
  def index
    @reservations = Reservation.where(user_id: current_user.id)
  end

  def confirm
    @reservation = Reservation.new(reservation_params)
    @room = Room.find(params[:reservation][:room_id])
    @user_id = current_user.id

    if @reservation.valid?
      stay_days = @reservation.checkout - @reservation.checkin
      @stay_days = stay_days.to_i
      @cost = @room.charge * @reservation.guest * @stay_days
    else
      flash[:warning] = "予約内容に誤りがあります"
      render "/rooms/show"
    end
  end

  def back
    @reservation = Reservation.new(params.require(:reservation).permit(:user_id, :room_id, :checkin, :checkout, :guest))
    @room = Room.find(@reservation.room_id)
    @user = User.find(@reservation.user_id)
    render "/rooms/show"
  end

  def create
    @reservation = Reservation.new(reservation_params)
    if @reservation.save
      flash[:notice] = "予約をしました"
      redirect_to "/reservations"
    else
      flash[:warning] = "予約に失敗しました！！"
      render "/room/show"
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def reservation_params
    params.require(:reservation).permit(:checkin, :checkout, :guest, :user_id, :room_id)
  end
end
