class AuthorsController < ApplicationController
  def new
    @author = Author.new
    @author.books.build
    #@book = Book.new
  end

  
    # (0..1).to_a.map do |i|
    #   i = i.to_s
    #   @c_params.dig(:author,:books_attributes,i.to_s)[:genre_id] = Genre.find_by_name(@c_params.dig(:author,:books_attributes,i.to_s,:genre)).id
    # end
  

  def create
    @author = Author.new(book_params)
    if @author.save
      redirect_to root_path
    else
      flash[:error] = "a bug."
      render :new
    end
  end

  def book_params
    params.require(:author).permit(:name,  :country_id,  books_attributes:  [:id, :title, :genre, :genre_id])
  end
end
