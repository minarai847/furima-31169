class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

         validates :nickname, presence: true
         EMAIL = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
         validates :email, presence: true, uniqueness: true, format: {with: EMAIL}
         validates :occupation, presence: true
         validates :position, presence: true
         
        has_many :comments
         has_many :prototypes

end
