class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :correct_users,only: [:edit]

  def correct_users
        @user = User.find(params[:id])
    unless @user.id == current_user.id
      redirect_to user_path(current_user.id)
    end
  end

  def show
    @book_new = Book.new
    @book = Book.find(params[:id])
    @user = User.find(params[:id])
    @booksall = Book.all
    @books = @booksall.page(params[:page]).reverse_order
  end

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    @users = User.all
    if @book.save
      flash[:notice] = "successfully"
      redirect_to book_path(current_user.id)

    else
      render :index
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def index
    @book = Book.new
    @usermy = current_user
    @users = User.page(params[:page]).reverse_order
    @users_follow = User.where.not(id: current_user.id)

  end

  def followings
    @user = current_user
    @book = Book.new
    user = User.find(params[:id])
    @users = user.followings
  end

  def followers
    @user = current_user
    @book = Book.new
    user = User.find(params[:id])
    @users = user.followers
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:notice] = "successfully"
      redirect_to user_path(@user.id)

    else
      render :edit
    end
  end

  private

  def book_params
    params.require(:book).permit(:title,:body)
  end

  def user_params
    params.require(:user).permit(:name,:profile_image,:introduction)
  end

end
