class BooksController < ApplicationController
  def index
    @books = Book.all
  end

  def new
  end

  def create
    book = Book.new(book_params)
    if book.save
      redirect_to :books
    else
      # ?
    end
  end

  def destroy
    book = Book.find(params[:id])
    if book.destroy
      redirect_to :books
    else
      # ?
    end
  end

  private
  def book_params
    params.require(:book).permit(:title, :author)
  end
end
