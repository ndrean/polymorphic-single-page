Rails.application.routes.draw do
  get 'users/new'
  get 'users/create'
  root to: 'books#index'
  
  
  resources :books, only: [:index, :new, :create]
  get 'books/reviews_by_title'
  get 'books/reviews_by_user'
  get 'books/books_by_author'

  get 'books/display_json'
  get 'books/books_ajax'

  post 'get_form_cookie', to: 'books#get_form_cookie' # gives us get_for_cookie_path
  #post 'books/get_form_cookie'
  post 'books/get_form_1'
  post 'books/get_form_simple_form'
  
  
  post 'get_form_ajax2', to: 'books#get_form_ajax2', as: 'get_form_ajax2'

  

  resources :authors, only: [:new, :create, :edit, :update]
  get 'authors/create_new_book'

  resources :genres, only: [:create, :destroy]
  
  post 'APIgenres', to: 'genres#APIcreate'
  # define custom route
  delete 'APIdestroy/:id', to: 'genres#APIdestroy'
  #match 'APIdestroy/:id', to: 'genres#APIdestroy', via: :delete

  #post 'genres/createGenre'
  #get 'genres/genresJson'

  resources :dynamics, only: [:new, :create]

end
