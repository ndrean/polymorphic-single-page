Rails.application.routes.draw do
  root to: 'books#index'
  #get 'books/get_reviews_by_title'
  get '/get_reviews_by_title', to: 'books#get_reviews_by_title'
  get '/get_reviews_by_user', to: 'books#get_reviews_by_user'
  get 'get_books_by_author', to: 'books#get_books_by_author'
  
end
