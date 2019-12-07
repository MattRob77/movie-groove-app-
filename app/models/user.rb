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
         omniauth_providers: [:google_oauth2]


  def self.from_omniauth(provider, uid, name, email)
    where(provider: provider, uid: uid).first_or_create do |user|
      user.email = email
      user.password = Devise.friendly_token[0, 20]
      user.username = name
        # assuming the user model has a name
               # If you are using confirmable and the provider(s) you use validate emails,
               # uncomment the line below to skip the confirmation emails.
               # user.skip_confirmation!
    end
  end
end
