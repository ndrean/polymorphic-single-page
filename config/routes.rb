Rails.application.routes.draw do
  root to: 'books#index'
  get 'books/get_reviews_by_title'
end
