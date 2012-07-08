class UsersController < ApplicationController
  def new
    @user  = User.new
    @title = I18n.t 'title.user.new'
  end

  def index
    @users = Users.paginate(page: params[:page])
    @title = I18n.t 'title.user.index'
  end

  def show
    @user  = User.find params[:id]
    @title = @user.name
  end

  def create
    @user = User.new params[:user]
    if @user.save
      flash[:success] = I18n.t 'flash.user.new.success', user: @user.name
      redirect_to @user
    else
      @user.password.clear
      @user.password_confirmation.clear
      @title = I18n.t 'title.user.new'
      render 'new'
    end
  end

  def edit
    @user  = User.find params[:id]
    @title = I18n.t 'title.user.edit' 
  end

  def update
  end

  def destroy
  end
end
