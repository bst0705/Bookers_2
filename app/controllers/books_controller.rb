class BooksController < ApplicationController

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    @book.save
    redirect_to book_path(book.id)
  end

  def index
    @book = Book.new
    @user = current_user
    @books = Book.page(params[:page]).reverse_order
  end

  def show
    @book = Book.new
    @book = Book.find(params[:id])
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to books_path
  end

  private

  def book_params
    params.require(:book).permit(:title,:body)
  end

end
