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

  post 'get_form', to: 'books#get_form'
  post 'books/get_form_1'
  post 'books/get_form_simple_form'
  post 'get_form_ajax2', to: 'books#get_form_ajax2', as: 'get_form_ajax2'

  

  resources :authors, only: [:new, :create, :edit, :update]
  get 'authors/create_new_book'

  resources :genres, only: [:create, :destroy]
  
  post 'APIgenres', to: 'genres#APIcreate'
  # define custom route
  #match 'APIdestroy/:id', to: 'genres#APIdestroy', via: :delete
  delete 'APIdestroy/:id', to: 'genres#APIdestroy'

  #post 'genres/createGenre'
  #get 'genres/genresJson'

  resources :dynamics, only: [:new, :create]

end
