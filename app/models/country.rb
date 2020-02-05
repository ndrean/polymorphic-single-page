class Country < ApplicationRecord
    has_many :authors

    has_many :books, through: :authors
    # => country.books

    # COUNTRIES = []
    # 100.times do
    #     COUNTRIES << Faker::Nation.flag
    # end
    # COUNTRIES = COUNTRIES.to_set.to_a

end
