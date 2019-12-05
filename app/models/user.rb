class User < ApplicationRecord
  has_many :reviews
  has_many :reviewed_movies, through: :reviews, source: :movie

  has_many :movies #That the user has created

  validates :username, uniqueness: true, presence: true
  validates :email, uniqueness: true, presence: true

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :omniauthable,
         :omniauth_providers => [:google_oauth2]

   def self.from_omniauth(auth)
     # Either create a User record or update it based on the provider (Google) and the UID
     where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
       user.token = auth.credentials.token
       user.expires = auth.credentials.expires
       user.expires_at = auth.credentials.expires_at
       user.refresh_token = auth.credentials.refresh_token
     end
   end
end
