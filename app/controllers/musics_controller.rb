class MusicsController < ApplicationController
  before_action :force_index_redirect, only: [:index]

  def show
    id = params[:id] 
    @music = Music.find(id) 
  end

  def index
    @all_categories = Music.all_categories
    @musics = Music.with_categories(categories_list, sort_by)
    @categories_to_show_hash = categories_hash
    @sort_by = sort_by
    # remember the correct settings for next time
    session['categories'] = categories_list
    session['sort_by'] = @sort_by
  end

  def new
    # default: render 'new' template
  end

  def create
    @music = Music.create!(music_params)
    flash[:notice] = "#{@music.title} was successfully created."
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

  private

  def force_index_redirect
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