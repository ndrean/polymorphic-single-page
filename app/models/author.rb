class Author < ApplicationRecord
  belongs_to :country
  
  has_many :reviews, as: :reviewable
  has_many :books
end
