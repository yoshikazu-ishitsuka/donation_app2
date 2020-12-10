class DonationsController < ApplicationController
  def index
  end

  def new
    # @user = User.new
  end

  def create
    user = User.create(user_params)
    Address.create(address_params(user))
    Donation.create(donation_params(user))
    redirect_to action: :index
  end

  # def create
  #   # binding.pry
  #   @user = User.new(donation_params)
  #   if @user.valid?
  #     @user.save
  #     redirect_to action: :index
  #   else
  #     render action: :new
  #   end
  # end

  private

  def user_params
    params.permit(:name, :name_reading, :nickname)
  end

  def address_params(user)
    params.permit(:postal_code, :prefecture, :city, :house_number, :building_name).merge(user_id: user.id)
  end

  def donation_params(user)
    params.permit(:price).merge(user_id: user.id)
    # params.require(:user).permit(:name, :name_reading, :nickname)
  end
end
