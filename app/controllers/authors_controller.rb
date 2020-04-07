class AuthorsController < ApplicationController
  # def local_binding
  #   binding
  # end

  def new
    @author = Author.new
    @author.books.build
    @author.books.build
    
    # since the 'simple_field_for' iterates on all books, we can create
    # another related book when adding another time
    #@author.books.build
    

    @genres =  Genre.all
    @genre = Genre.new

    #
    @author.books.build.reviews.build
  end

  def create
    @author = Author.new(author_params)
    logger.debug ".............................create"
    if @author.save
      redirect_to root_path, notice: "Success"
    else
      redirect_to new_author_path, notice: "Not saved"
    end
  end

  def create_new_book
     #  https://www.youtube.com/watch?v=n6eE-nd3ci4
    @books = @author.books.new
    respond_to do |format|
      format.js
    end
  end

  
  def edit
    @author = Author.find(params[:id])
    @author.books.build
    # @author.books.build.genre.build
  end

  def update
  end

private
  def author_params
    #params.require(:author).permit(:name,  :country_id, :genre, :author_id, :author.object_id, books_attributes:  [:id, :title, :genre_id, :_destroy])
    params.require(:author).permit(:name, :country_id, :genre,
       books_attributes: Book.attribute_names.map(&:to_sym).push(:_destroy))
  end

  # def book_params
  #   params.require(:book).permit(:id, :title, :genre_id,:_destroy)
  # end
end
