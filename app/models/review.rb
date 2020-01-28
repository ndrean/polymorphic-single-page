class Review < ApplicationRecord
  belongs_to :reviewable, polymorphic: true
  # => type Book or Author is stored in 'reviewable_type', and correponsding id in 'reviewable_id'
  
  belongs_to :user

  scope :reviewed, -> {joins(:reviews)}

  scope :not_reviewed, -> {where(comment: nil)}

  scope :get_reviews, -> {joins(:reviews)} #?
end
