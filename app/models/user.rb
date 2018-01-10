class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, 
         :recoverable, :rememberable, :trackable, :validatable
  
  
  has_many :flashcards, through: :decks
  has_many :review_logs, through: :decks
  has_many :decks, dependent: :destroy
end
