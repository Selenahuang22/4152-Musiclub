require 'date'
class PaymentController < ApplicationController
  before_action :check_login

  def index
    @music = Music.find params[:format]
    session[:ordered_music] = @music
  end


  def create_payment
    if !@music
      @music = session[:ordered_music]
    end
    card_number = params[:payment][:card_number].strip
    expiration_date = params[:payment][:expiration_date].strip
    cvv = params[:payment][:cvv].strip
    holder_name = params[:payment][:holder_name].strip
    expiration_date_reg = /^((0[1-9])|(1[0-2]))\/((20[2][2-9]))$/
    if card_number.length == 16 && expiration_date.match(expiration_date_reg) && expiration_date.length == 7 && cvv.length == 3 && holder_name.length > 0
      @current_user.musics_download << @music
      order = OrderDetail.create(music_id:@music.id, account_id:@current_user.id, status:0, price: '0.00')
      redirect_to download_index_path, notice: "#{@music.title} has been downloaded to your download library"
      session[:ordered_music] = nil
    else
      flash.notice = "Invalid payment information!"
      render :index
    end

  end

end
