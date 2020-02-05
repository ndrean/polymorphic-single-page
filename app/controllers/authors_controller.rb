class AuthorsController < ApplicationController
  def new
    @author = Author.new
    @author.books.build
    #@author.books.build
    #@author.books.build

    @genres =  Genre.all
    @genre = Genre.new
  end

  def create
    @author = Author.new(book_params)
    binding.pry
    if @author.save
      flash[:success] = "good job"
      redirect_to root_path
      
    else
      flash[:errors] = @author.errors.full_messages
      redirect_to new_author_path
    end
  end

  def edit
    
  end

  def update

  end

  def book_params
    params.require(:author).permit(:name,  :country_id, :genre,
        books_attributes:  [:title, :genre_id, '_destroy'])
  end
end
