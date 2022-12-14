class AccountsController < ApplicationController
  before_action :check_login, except:[:signup,:create_account,:login,:create_login,:logout]

  def login
  end

  def create_login
    email = params[:user][:email].strip
    password_html = params[:password].strip
    account = Account.find_by(email:email)
    if account
      if account.password == password_html
        session[:account_id] = account.id
        flash.notice = "Login successfully!"
        redirect_to musics_path
      else
        flash.notice = "Invalid user or password!"
        render :login
      end
    
    else
      flash.notice = "User does not exist, please sign in!"
      render :login
    end 

  end

  def logout
    session[:account_id] = nil
    redirect_to login_path
  end
  
  def signup
  end

  def create_account
    name = params[:user][:name].strip
    email = params[:user][:email].strip
    password_html = params[:password].strip
    account = Account.find_by(email:email)
    if account
      flash.notice = "This account already exists!"
      render :signup
    else
      Account.create({:name => name, :email => email, :password => password_html, :admin => false })
      flash.notice = "Signup successfully!"
      render :login
    end 
    
  end
end
