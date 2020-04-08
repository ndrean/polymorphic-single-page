class Author < ApplicationRecord
  belongs_to :country
  
  has_many :reviews, as: :reviewable
  has_many :books, inverse_of: :author, dependent: :destroy # to delete all books associated
  has_many :genres, through: :books

  validates :name, presence: true, uniqueness: { case_sensitive: false }
  
  accepts_nested_attributes_for :books, :genres, allow_destroy: true, reject_if: :all_blank


  def self.find_author_books(search)
    if search.present? && !search[:input_name].empty?
      author_name = search[:input_name]
      @author_books = []
      author_name[1..-1].each do |author|
        @author_books << Author.includes(:books).find_by(name: author)
      end
    end
    return @author_books
  end

end
