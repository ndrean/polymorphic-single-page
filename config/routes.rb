Rails.application.routes.draw do
  
  #get 'genres/new'
  #get 'authors/genres/create'
  get 'users/new'
  get 'users/create'
  root to: 'books#index'
  get 'authors/create_new_book'
  
  get 'books/reviews_by_title'
  get 'books/reviews_by_user'
  get 'books/books_by_author'
  
  get 'books/display_json'
  get 'books_ajax', to: 'books#books_ajax', as: 'books_ajax' 
  post 'get_form', to: 'books#get_form', as: 'get_form'
  post 'get_form_ajax', to: 'books#get_form_ajax', as: 'get_form_ajax'
  post 'get_form_ajax2', to: 'books#get_form_ajax2', as: 'get_form_ajax2'

  resources :books, only: [:index, :new, :create]
  resources :authors, only: [:new, :create, :edit, :update]

  resources :genres, only: [:create]
  #get 'authors/new', to: 'authors#new', as: 'new_author' #=> voir RAILS ROUTES
  #post 'authors/create'
  
end

# by declaring 'root: 'books#index', we can get rid of the 'books/' prefix and the alias