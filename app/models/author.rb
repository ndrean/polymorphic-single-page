class Author < ApplicationRecord
  belongs_to :country
  
  has_many :reviews, as: :reviewable
  has_many :books
  has_many :genres, through: :books

  validates :name, presence: true, uniqueness: { case_sensitive: false }
  accepts_nested_attributes_for :books, allow_destroy: true  
end
