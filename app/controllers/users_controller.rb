class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :correct_users,only: [:edit]

  def correct_users
        @user = User.find(params[:id])
    unless @user.id == current_user.id
      redirect_to users_path
    end
  end

  def show
    @book = Book.new
    @user = current_user
    @usershow = User.find(params[:id])
    @books = @usershow.books.page(params[:page]).reverse_order
  end

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
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
    @user = current_user
    @users = User.page(params[:page]).reverse_order
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
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
