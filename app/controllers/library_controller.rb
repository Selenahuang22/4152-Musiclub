class LibraryController < ApplicationController
    before_action :check_login, only:[:index]
  
    def index
        if @current_user.nil?
            redirect_to login_path
        else
            @library_musics = @current_user.musics_download
        end
    end

    def download_to_local
        # this is a fake music to download, every music will point to this fake music
        send_file "#{Rails.root}/public/MerryChristmas.mp3", :type=>"application/mp3", :x_sendfile=>true
    end

  end