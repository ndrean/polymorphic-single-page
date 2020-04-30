class BooksController < ApplicationController

  def index
    
    @books = Book.includes( {author: :country}, :genre ) #{reviews: :user},
    @users = User.includes(reviews: :reviewable)

    @authors = Author.includes(:books, :country)

    # scope declared in model 'Book'
    @unreviewed_books = Book.unreviewed
    @reviewed_books = Book.reviewed

    # collections for select forms
    @titles = Book.order(:title).titles # from model
    @users_names = User.order(:name).pluck(:name)
    @list_authors = Author.order(:name).pluck(:name)
    
    # Nested form through association: new author > new book < new genre
    @author = Author.new
    @author.books.build#.genre.build
    
    #@new_genre = Genre.create!(name: "Click to add new genre")
    @genres =  Genre.all
    @genre = Genre.new
  end

  def reviews_by_title
    # method 'find_reviews_by_title' defined in model 'Review' with 'self'
    @reviews_title = Review.find_reviews_by_title(params[:search])
    #binding.pry
    @titles = []
    @reviews_title[0..-1].each do |review|
      @titles << Book.find_by_id(review.reviewable_id).title
    end
    #binding.pry
    respond_to do |format|
      format.js
    end
  end

  def reviews_by_user
    # method 'find_reviews_by_title' defined in model 'Review' with 'self'
    @user_reviews = Review.find_reviews_by_user(params[:search])
    # if @user_reviews.class == Array
    #   @user_reviews = Kaminari.paginate_array(@user_reviews).page(params[:page]).per(5)
    # end
    respond_to do |format|
      format.js
    end
  end
  
  def books_by_author
    # method 'find_author_books' defined in model 'Author' with 'self'
    @author_books = Author.find_author_books(params[:search])
    #binding.pry
    respond_to do |format|
      format.js
    end
  end

  def display_json
    books = Book.includes(:author, :genre)
    render json: books.to_json(include:  {author: {only: :name}, genre: {only: :name}})
    # this will 'lazy' render '/views/books/books_all.html.erb' with this view using @books 
    
  end

  def books_ajax
    @books = Book.includes( {author: :country}, :genre )
    respond_to do |format|
      format.js
    end
  end

  def get_form
    #binding.pry
    if params[:search].present?
      cookies[:form] = params[:search][:q]
      #logger.debug "........................1 : cookies[:form] = #{cookies[:form]}"
      redirect_to root_path
    end
  end
  
  def get_form_1
    @result = params[:q] # result transmitted to the view
    if @result.present?
        respond_to do |format|
          format.js
        end
    end
  end

  def get_form_simple_form
    @result = params[:search][:q]
    if @result.present?
      respond_to do |format|
        format.js
      end
    end
  end


  def new
    @book = Book.new
  end

  def create
    @book  = Book.new(book_params)
    if @book.save
      redirect_to root_path
    else
      flash[:error] = "a bug."
      render :new
    end
  end

  # def edit
  # end

  # def update
  # end

  # def book_params
  #   params.require(:book).permit(:title,  :author_id)
  # end


private
  def author_params
    # version select ok
    #params.require(:author).permit(:name,  :country_id, :genre, books_attributes:  [:title, :genre_id, '_destroy'])
    
    # Ok pour version radio
    params.require(:author).permit(:name,  :country_id, :genre,
        books_attributes:  [:title, :genre_id, '_destroy'])
  end
end
