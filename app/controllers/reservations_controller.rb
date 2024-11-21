class ReservationsController < ApplicationController
  before_action :set_reservation, only: [:edit, :update, :destroy]
  before_action :authenticate_user! # ログイン済みユーザーのみアクセス可能
  def index
    @reservations = Reservation.all
  end

  def new
    @reservation = Reservation.new()
  end

  def create
    @reservation = Reservation.new(reservation_params)
    @reservation.user = current_user # もしログインユーザーがいる場合
  
    if @reservation.save
      redirect_to root_path, notice: "予約を作成しました。" # 保存成功時
    else
      render :new # 保存失敗時
    end
  end

  def edit; end

  def update
    if @reservation.update(reservation_params)
      redirect_to reservations_path, notice: "予約を更新しました。"
    else
      render :edit
    end
  end

  def destroy
    @reservation.destroy
    redirect_to reservations_path, notice: "予約を削除しました。"
  end

  private

  def set_reservation
    @reservation = Reservation.find(params[:id])
  end

  def reservation_params
    params.require(:reservation).permit(:date, :content)
  end
end
