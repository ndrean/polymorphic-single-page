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
    # precharging for the form
    @names = Author.pluck(:name)

    #@get_reviews_by_user = Book.joins(:users).reviewed_by('Eddy')
  end

  def get_reviews_by_title
    #@titles = Book.titles ?
    query = params[:search]
    @title = params[:search][:input_title]
    if query.present? && !@title.nil?
      selected_book = Book.find_by_title(@title)
      @reviews_title = selected_book.reviews  
    elsif search.present? && @title.nil?
      @reviews_title = Review.all 
    end
    respond_to do |format|
      format.js
    end 
  end

  def get_books_by_author
    query = params[:search]
    name = params[:search][:input_name]
    if query.present? && !name.nil?
      @author = Author.find_by(name: input_name)
    elsif query.present? && name.nil?
      @author = Author.all
    end
    respond_to do |format|
      format.js
    end
    
  end

  def get_reviews_by_user
    search = params[:search]
    if search.present? && !search[:user_name].nil?
      @user_name = params[:search][:user_name]
      @user_reviews = User.find_by(name: @user_name).reviews
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
