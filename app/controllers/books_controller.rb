class BooksController < ApplicationController
  def index
    @user = User.find(current_user.id)
    @book = Book.new
    @books = Book.all
  end

  def create
    @user = User.find(current_user.id)
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
      flash[:notice] = "You have created book successfully."
      redirect_to book_path(@book)
    else
      flash[:notice] = "error prohibited this obj being saved:"
      flash.now[:errors] = @book.errors.full_messages
      redirect_to books_path
    end
  end

  def show
    @user = User.find(params[:id])
    @book = Book.find(params[:id])
    @newBook = Book.new
  end


  def edit
    @book = Book.find(params[:id])
  end

  def update
    book = Book.find(params[:id])
    book = Book.update(book_params)
    redirect_to book_path(book)
  end

  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to books_path
  end

  private

  def book_params
    params.require(:book).permit(:title, :body)
  end

end
