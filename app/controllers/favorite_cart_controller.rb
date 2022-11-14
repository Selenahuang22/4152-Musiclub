class FavoriteCartController < ApplicationController
    before_action :check_login, only:[:index]
  
    def index
        if @current_user.nil?
            redirect_to login_path
        else
            @favorite_musics = @current_user.musics_favorite
        end
    end

  end