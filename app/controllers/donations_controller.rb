class DonationsController < ApplicationController
  def index
  end

  def new
    @user = User.new(donation_params)
  end

  def create
    @user = User.new(donation_params)
    if @user.save
      redirect_to action: :index
    else
      render action: :new
    end
  end

  private

  def donation_params
    params.require(:user).permit(:name, :name_reading, :nickname)
  end
end