class BooksController < ApplicationController
  before_action :authenticate_user!
  before_action :correct_books,only: [:edit]

  def correct_books
        @book = Book.find(params[:id])
    unless @book.user.id == current_user.id
      redirect_to books_path
    end
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

  def index
    @book = Book.new
    @user = current_user
    @books = Book.page(params[:page]).reverse_order
  end

  def show
    @book = Book.new
    @book = Book.find(params[:id])
    @user = current_user
    @users = User.all
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to books_path
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
      redirect_to book_path(@book.id)
    else
      render :edit
    end
  end

  private

  def book_params
    params.require(:book).permit(:title,:body)
  end

end
