class Review < ApplicationRecord
  belongs_to :reviewable, polymorphic: true
  # => type Book or Author is stored in 'reviewable_type', and correponsding id in 'reviewable_id'
  
  belongs_to :user

  scope :reviewed, -> {joins(:reviews)}

  scope :not_reviewed, -> {where(comment: nil)}

  scope :get_reviews, -> {joins(:reviews)} #?

  def self.find_reviews_by_title(search)
    title = search[:input_title]
    if search.present? && !title.empty?
      @reviews_title = []
      title[1..-1].each do |t|
        @reviews_title += Book.includes(reviews: :user).find_by_title(t).reviews
      end
    end
    return @reviews_title
  end

  def self.find_reviews_by_user(search)
    user_names = search[:user_name]
    if search.present? && !user_names.empty?
      user_names = user_names[1..-1]
      @user_reviews = []
      user_names.each do |user|
        @user_reviews += User.includes( reviews: [ reviewable: [{ author: :country }, :country ]])
          .find_by(name: user).reviews
      end
    end
    return @user_reviews
  end
  
end
