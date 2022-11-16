class LibraryController < ApplicationController
    before_action :check_login, only:[:index]
  
    def index
        if @current_user.nil?
            redirect_to login_path
        else
            @library_musics = @current_user.musics_download
        end
    end

  end