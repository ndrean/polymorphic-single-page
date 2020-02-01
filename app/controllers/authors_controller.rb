class AuthorsController < ApplicationController
  def new
    @author = Author.new
    @author.books.build
  end

  def create
    @author = Author.new(book_params)
    if @author.save
      redirect_to root_path
    else
      flash[:error] = "a bug."
      redirect_to new_author_path
    end
  end

  def edit
    
  end

  def update

  end

  def book_params
    params.require(:author).permit(:name,  :country_id,  books_attributes:  [:title, :genre, :genre_id, '_destroy'])
  end
end
