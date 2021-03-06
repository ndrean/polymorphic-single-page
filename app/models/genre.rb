class Genre < ApplicationRecord
    has_many :books
    has_many :authors, through: :books
    has_many :reviews, through: :books
    # => genre.reviews
    has_many :authors, through: :books

    validates :name, uniqueness: true, presence: true
    
    accepts_nested_attributes_for :books, reject_if: :all_blank

    # def find_reviews_by_genre
    #     id_array = Book.all.select { |book| book.genre_id == self.id }

    # end
end
