class Review < ApplicationRecord
  belongs_to :movie
  belongs_to :user

  def self.random_review
    Review.all.sample
  end
end
