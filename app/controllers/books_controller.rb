class BooksController < ApplicationController
  def index
    @books = Book.includes({reviews: :user})
    @users = User.includes(reviews: :reviewable)
    # => since user => books declared with "through: :reviews"
    @usersb = User.includes({books: {author: :country}})

    @authors = Author.includes(:books, :country)

    @unreviewed_books = Book.unreviewed
    @reviewed_books = Book.reviewed

    @titles = Book.titles # from model

    selected_book = Book.get_by_title('Golden')
    @title = selected_book.title
    @reviews_title = selected_book.reviews

    @get_reviews_by_user = Book.joins(:users).reviewed_by('Eddy')
  end

  def get_reviews_by_title
        #@titles = Book.titles
        if params[:search].present?
            title = params[:search][:name]
            selected_book = Book.get_by_title(title)
            @title = selected_book.title
            @reviews_title = selected_book.reviews
        end
        respond_to do |format|
          # format.html { render 'books/reviews_by_title', title: @title, reviews_title: @reviews_title }
          format.js
        end
  end

  private
  # def search_params
  #   params.require(:search).permit(:name)
  # end
end
