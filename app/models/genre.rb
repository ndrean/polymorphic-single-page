class Genre < ApplicationRecord
    has_many :books
    has_many :reviews, through: :books
    # => genre.reviews
end
