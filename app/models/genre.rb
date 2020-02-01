class Genre < ApplicationRecord
    has_many :books
    has_many :reviews, through: :books
    # => genre.reviews
    has_many :authors, through: :books

    accepts_nested_attributes_for :books
end
