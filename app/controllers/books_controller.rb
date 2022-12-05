class BooksController < ApplicationController
  def new
    @book = Book.new
  end

  # def create
  #   book = Book.new(book_params)
  #   book.save
  #   redirect_to '/books/'
  # end
  
  def create
    book = Book.new(book_params)
    if book.save
      # flash[:notice] = "投稿が成功しました"
      redirect_to list_path(book.id)
    else
      # @lists = List.all
      render :new
    end
  end


  def index
    @books = Book.all
    
    @book = Book.new
  end

  def show
    @book = Book.find(params[:id])
  end

  def edit
    @book = Book.find(params[:id])
  end

  private
  def book_params
    params.require(:book).permit(:title, :body)
  end
end
