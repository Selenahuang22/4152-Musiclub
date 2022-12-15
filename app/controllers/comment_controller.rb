
class CommentController < ApplicationController
  before_action :check_login

  def index
    @music = Music.find params[:format]
    session[:music_id] = params[:format]
  end

  def add_comment
    if !@music
      @music = Music.find session[:music_id]
    end
    content = params["comment"]["content"]
    if content.strip().length > 0
        Comment.create!({
            music_id: @music.id,
            music_title: @music.title,
            account_id: @current_user.id,
            account_name: @current_user.name,
            content: content
        })
    end
    session[:music_id] = nil
    redirect_to music_path(@music)
  end


  def manage
    @comments = Comment.all
  end


  def destroy
    @comment = Comment.find(params[:format])
    @comment.destroy
    flash[:notice] = "Comment '#{@comment.content}' removed."
    redirect_to comment_manage_path
  end

end
