class BooksController < ApplicationController
  def index
    @books = Book.includes({reviews: :user})
        @users = User.includes(reviews: :reviewable)
        # => since user => books declared with "through: :reviews"

        @usersb = User.includes({books: {author: :country}})
        @authors = Author.includes(:books, :country)

        @unreviewed_books = Book.unreviewed
        @reviewed_books = Book.reviewed

        @get_reviews_by_user = Book.joins(:users).reviewed_by('Ilene')

        #@get_reviews_by_title = Book.get_reviews("The Last Enemy")
  end

  def get_reviews_by_title
  end
end
