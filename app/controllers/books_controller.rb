class BooksController < ApplicationController

  def index
    
    @books = Book.includes({reviews: :user}, {author: :country}, :genre)
    @users = User.includes(reviews: :reviewable)
    
    # => since user => books declared with "through: :reviews"
    #@usersb = User.includes({books: {author: :country}})

    @authors = Author.includes(:books, :country)

    @unreviewed_books = Book.unreviewed
    @reviewed_books = Book.reviewed

    # collections for select forms
    @titles = Book.titles # from model
    @users_names = User.pluck(:name)
    @list_authors = Author.pluck(:name)
    
  end

  def get_reviews_by_title

    query = params[:search]
    @title = params[:search][:input_title]
    if query.present? && !@title.empty?
      @reviews_title = []
      @title[1..-1].each do |t|
        @reviews_title += Book.includes(:reviews => [:user]).find_by_title(t).reviews
      end
    end

    respond_to do |format|
      format.js
    end

  end


  def get_books_by_author

    if params[:search].present? && !params[:search][:input_name].empty?
      author_name = params[:search][:input_name]
      @author_books = []
      
      author_name[1..-1].each do |a|
        @author_books << Author.includes(:books).find_by(name: a)
      end
    end

    respond_to do |format|
      format.js
    end

  end


  def get_reviews_by_user

    @user_name = params[:search][:user_name]
    if params[:search].present? && !@user_name.empty?
      @user_reviews = []
      @user_name[1..-1].each do |u|
        @user_reviews += User.includes( reviews: [ reviewable: [{ author: :country }, :country ]])
          .find_by(name: u).reviews
      end
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
