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
      render :index
    end
  end

  def show
    @user = User.find(current_user.id)
    @book = Book.find(params[:id])
    @newBook = Book.new
  end


  def edit
    @book = Book.find(params[:id])
  end

  def update
    book = Book.find(params[:id])
    if book = Book.update(book_params)
       redirect_to book_path(book), notice: "You have updated book successfully."
    else
      flash.now[:alert] = "errors prohibited this book from being saved:"
      render :edit
    end
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
