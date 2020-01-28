class BooksController < ApplicationController
  def index
    @books = Book.includes({reviews: :user}, {author: :country}, :genre)
    @users = User.includes(reviews: :reviewable)
    @users_names = User.pluck(:name)
    # => since user => books declared with "through: :reviews"
    @usersb = User.includes({books: {author: :country}})

    @authors = Author.includes(:books, :country)
    @list_authors = Author.pluck(:name)

    @unreviewed_books = Book.unreviewed
    @reviewed_books = Book.reviewed

    # precharging for the form
    @titles = Book.titles # from model
    
    

    #@get_reviews_by_user = Book.joins(:users).reviewed_by('Eddy')
  end

  def get_reviews_by_title
    query = params[:search]
    @title = params[:search][:input_title]
    if query.present? && !@title.empty?
      binding.pry
      selected_book = Book.find_by_title(@title)
      @reviews_title = selected_book.reviews  
    elsif search.present? && @title.empty?
      @reviews_title = Review.all 
    end
    respond_to do |format|
      format.js
    end 
  end

  def get_books_by_author
    if params[:search].present? && !params[:search][:input_name].empty?
      author_name = params[:search][:input_name]
      @author = Author.find_by(name: author_name)
    end
    respond_to do |format|
      format.js
    end
  end

  def get_reviews_by_user
    @user_name = params[:search][:user_name]
    if params[:search].present? && !@user_name.empty?
      @user_reviews = User.includes(reviews: [:reviewable => {author: :country}]).find_by(name: @user_name).reviews
    end
    respond_to do |format|
      format.js
    end
  end
  
  private
  # def search_params
  #   params.require(:search).permit(:name)
  # end
end
