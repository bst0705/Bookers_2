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
    # Bookモデルに新しいやつを入れる
    @book.user_id = current_user.id
   if @book.save
     flash[:notice] = "successfully"
      redirect_to book_path(@book.id)
      # 元々Bookモデルにはidが複数あり、@book.idで最新のものを持ってくる
      # パスにparamsは入れられない。
   else
     @user = current_user
     @books = Book.page(params[:page]).reverse_order
      render :index
   end
  end

  def index
    @book = Book.new

    @user = current_user
    @books = Book.page(params[:page]).reverse_order
  end

  def show
    @book_new = Book.new
    @book_comment = BookComment.new
    @book = Book.find(params[:id])
    @user = current_user
    @comments = @book.book_comments.order(created_at: :desc)
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
      flash[:notice] = "successfully"
      redirect_to book_path

    else
      render :edit
    end
  end

  private

  def book_params
    params.require(:book).permit(:title,:body)
  end

end


