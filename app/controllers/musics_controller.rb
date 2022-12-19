class MusicsController < ApplicationController
  before_action :check_login
  before_action :force_index_redirect, only: [:index]

  def show
    id = params[:id] 
    @music = Music.find(id) 
    @comments_content = Comment.with_music(@music.id)
  end

  def index
    @all_categories = Music.all_categories
    @musics = Music.with_categories(categories_list, sort_by)
    if !session['search_res'].nil?
      @search_music=Music.where(title: session['search_res'])
      @musics=@search_music
      session['search_res']=nil
    end
    @categories_to_show_hash = categories_hash
    @sort_by = sort_by
    # remember the correct settings for next time
    session['categories'] = categories_list
    session['sort_by'] = @sort_by
  end

  def search
    session['search_res']=nil
    @search_result=Music.search_by(params[:search])
    session['sort_by']='title'
    session['search_res']=@search_result
    redirect_to musics_path(@search_result)
  end
  
  def new
    # default: render 'new' template
  end

  def create
    if !(params[:music]['title']=="" || params[:music]['description']=="" || params[:music]['singer']=="")
      @music = Music.create!(music_params)
      flash[:notice] = "#{@music.title} was successfully created."
    else
      flash[:notice] = "One or more information of the new song weren't filled, creation failed"
    end
    redirect_to musics_path
  end

  def edit 
    @music = Music.find params[:id]
  end

  def update
    @music = Music.find params[:id]
    @music.update_attributes!(music_params)
    flash[:notice] = "#{@music.title} was successfully updated."
    redirect_to music_path(@music)
  end

  def destroy
    @music = Music.find(params[:id])
    @music.destroy
    flash[:notice] = "Music '#{@music.title}' deleted."
    redirect_to musics_path
  end

  def download
    @music = Music.find params[:format]
    @current_user.musics_download << @music
    redirect_to download_index_path, notice: "#{@music.title} has been downloaded to your download library"
  end


  def download_remove
    @music = Music.find params[:format]
    @current_user.musics_download.delete(@music)
    redirect_to download_index_path, notice: "#{@music.title} has been removed from your downloading library"
  end


  def favorite
    @music = Music.find params[:format]
    @current_user.musics_favorite << @music
    redirect_to favorite_index_path, notice: "#{@music.title} has been added to your favorite"
  end

  def favorite_remove
    @music = Music.find params[:format]
    @current_user.musics_favorite.delete(@music)
    redirect_to favorite_index_path, notice: "#{@music.title} has been removed from your favorite"
  end

  # def payment
  #   @music = Music.find params[:format]
  #   redirect_to payment_index_path(@music)
  # end


  private

  def force_index_redirect
    puts 
    if !params.key?(:categories) || !params.key?(:sort_by)
      flash.keep
      url = musics_path(sort_by: sort_by, categories: categories_hash)
      redirect_to url
    end
  end

  def categories_list
    params[:categories]&.keys || session[:categories] || Music.all_categories
  end

  def categories_hash
    Hash[categories_list.collect { |item| [item, "1"] }]
  end

  def sort_by
    params[:sort_by] || session[:sort_by] || 'id'
  end

  private
  # Making "internal" methods private is not required, but is a common practice.
  # This helps make clear which methods respond to requests, and which ones do not.
  def music_params
    params.require(:music).permit(:title, :category, :description, :release_date, :singer)
  end
end
