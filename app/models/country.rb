class Country < ApplicationRecord
    has_many :authors

    has_many :books, through: :authors
    # => country.books
end
