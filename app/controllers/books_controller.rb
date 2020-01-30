class BooksController < ApplicationController

  def index
    
    @books = Book.includes( :genre, {author: :country}) #{reviews: :user},
    @users = User.includes(reviews: :reviewable)
    
    # => since user => books declared with "through: :reviews"
    #@usersb = User.includes({books: {author: :country}})

    @authors = Author.includes(:books, :country)

    @unreviewed_books = Book.unreviewed
    @reviewed_books = Book.reviewed

    # collections for select forms
    @titles = Book.order(:title).titles # from model
    @users_names = User.order(:name).pluck(:name)
    @list_authors = Author.order(:name).pluck(:name)
    
  end

  def get_reviews_by_title

    query = params[:search]
    @title = params[:search][:input_title]
    if query.present? && !@title.empty?
      @reviews_title = []
      @title[1..-1].each do |t|
        @reviews_title += Book.includes(reviews: :user).find_by_title(t).reviews
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

    user_names = params[:search][:user_name]
    if params[:search].present? && !user_names.empty?
      user_names = user_names[1..-1]
      @user_reviews = []
      user_names.each do |u|
        @user_reviews += User.includes( reviews: [ reviewable: [{ author: :country }, :country ]])
          .find_by(name: u).reviews
      end
    end

    respond_to do |format|
      format.js
    end

  end
  
# if we make the HTTP request 'url = .../books/books_all' (or an alias depending upon root),
 # this will trigger the action 'books_all' in the controller 'books', since this association
  # is declared in 'routes.rb'

  def books_all
    @books = Book.includes( {author: :country}, :genre ).all
    
    # => this will 'lazy' render '/views/books/books_all.html.erb' with this view using @books 

    # if we declare a partial 'books/_reviews_all.html.erb', se can use it with:
    #render partial: 'books/books_all', locals: {books: Book.all} 
    #and this partial uses locally the variable 'books'
  end

  def books_all_ajax
    @books = Book.includes( {author: :country}, :genre ).all
    respond_to do |format|
      format.js
    end
  end

  def get_form
    if params[:search].present?
      cookies[:form] = params[:search][:input]
      #redirect_to root_path
    end
  end
  
  def get_form_ajax
    if params[:search].present?
      @input = params[:search][:input]
      respond_to do |format|
        format.js
      end
    end
  end

end
