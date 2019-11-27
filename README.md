# Movie-Groove-app (Movie Review Site)

## User
- Username
- Email
- Password
- has_many :reviews
- has_many :movies through: :reviews

#Genre
- Name
- has_many :movies


## Movie
- Name
- Description
- genre_id
- has_many :reviews
- has_many :users through: :reviews
- belongs_to :genre
- belongs_to :user 


## Reviews
- Stars
- Title
- Content
- Movie_id
- User_id
- belongs_to :movie
- belongs_to :user
