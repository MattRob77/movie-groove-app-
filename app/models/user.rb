class User < ApplicationRecord
  has_many :reviews
  has_many :reviewed_movies, through: :reviews, source: :movie

  has_many :movies #That the user has created

  validates :username, uniqueness: true, presence: true
  validates :email, uniqueness: true, presence: true

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

end 
