class Author < ApplicationRecord
  belongs_to :country
  
  has_many :reviews, as: :reviewable
  has_many :books

  accepts_nested_attributes_for :books, allow_destroy: true  
end
