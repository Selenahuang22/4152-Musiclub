class PaymentController < ApplicationController
  # before_action :check_login, except:[:signup,:create_account,:login,:create_login,:logout]

  def index
  end

  def create_payment
    card_number = params[:payment][:card_number].strip
    expiration_date = params[:payment][:expiration_date].strip
    cvv = params[:payment][:cvv].strip
    holder_name = params[:payment][:holder_name].strip
    redirect_to download_index_path
    #, notice: "#{@music.title} has been downloaded to your download library"

  end

end
