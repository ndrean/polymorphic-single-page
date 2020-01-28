class Book < ApplicationRecord
  belongs_to :author
  belongs_to :genre

  has_many :reviews, as: :reviewable
  
  has_many :users, through: :reviews
  # => (Book.first).users
  # => Book.joins(:users).where("users.name ILIKE ?", "%Ilene%") is possible now

  scope :reviewed_by, -> (name) {merge(User.set_name(name).references(:users))}
  # uses the scope 'set_name' defined in the model 'User'. 'references(:users) needed.

  # includes already makes a distinct
  # the scope 'not_reviewed' is defined in the model 'Review'
  scope :unreviewed, -> {includes(:reviews).merge(Review.not_reviewed).references(:reviews)}

  # joins will include the table reviews, so only when a review exists
  scope :reviewed, -> {joins(:reviews).distinct }

  scope :find_by_title, ->(title) {self.where("title ILIKE ?", "%#{title}%").first}

  scope :titles, -> { self.pluck(:title)}
end
