class User < ApplicationRecord
    has_many :reviews

 # https://github.com/Sihui/sihui_io_rails_toy/blob/polymorphic-has-many-through-quiz-answer/app/models/subscription.rb    
    has_many :books, through: :reviews, source: :reviewable, source_type: 'Book'
    # => user.books

    has_many :authors, through: :reviews, source: :reviewable, source_type: 'Author'
    # => user.authors

    # model user
    scope :set_name, -> (name) {where("name ILIKE ?", "%#{name}%")}
end
