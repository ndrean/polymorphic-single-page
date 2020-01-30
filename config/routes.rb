Rails.application.routes.draw do
  #root to: 'books#index'
  get 'books/index', to: 'books#index', as: 'root'
  get 'books/get_reviews_by_title', to: 'books#get_reviews_by_title', as: 'get_reviews_by_title'
  get 'books/get_reviews_by_user', to: 'books#get_reviews_by_user', as: 'get_reviews_by_user'
  get 'books/get_books_by_author', to: 'books#get_books_by_author', as: 'get_books_by_author'
  get 'books/books_all', to: 'books#books_all', as: 'books_all'
  get 'books/books_all_ajax', to: 'books#books_all_ajax', as: 'books_all_ajax' 
  post 'books/get_form', to: 'books#get_form', as: 'get_form'
  post 'books/get_form_ajax', to: 'books#get_form_ajax', as: 'get_form_ajax'
  
end

# by declaring 'root: 'books#index', we can get rid of the 'books/' prefix and the alias