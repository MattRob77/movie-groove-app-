class Movie < ApplicationRecord
  has_many :reviews
  has_many :users, through: :reviews
  belongs_to :genre

  accepts_nested_attributes_for :genre

  validates :name, presence: true
  validates :description, presence: true

  def self.alphabetical_order #scope 
    order(:name)
  end

end
