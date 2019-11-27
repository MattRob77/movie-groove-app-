class Review < ApplicationRecord
  belongs_to :Movie
  belongs_to :user 
end
