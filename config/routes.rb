Rails.application.routes.draw do
  #root to: 'books#index'
  get 'books/index', to: 'books#index', as: 'root'
  get 'books/get_reviews_by_title', to: 'books#get_reviews_by_title', as: 'get_reviews_by_title'
  get 'books/get_reviews_by_user', to: 'books#get_reviews_by_user', as: 'get_reviews_by_user'
  get 'books/get_books_by_author', to: 'books#get_books_by_author', as: 'get_books_by_author'
  get 'books/reviews_all', to: 'books#reviews_all', as: 'reviews_all'
  get 'books/reviews_all_ajax', to: 'books#reviews_all_ajax', as: 'reviews_all_ajax' 
  
end

# by declaring 'root: 'books#index', we can get rid of the 'books/' prefix and the alias