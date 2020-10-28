class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         validates :nickname, presence: true
          # EMAIL = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
         validates :email, presence: true
        #  ,uniqueness: true, format: {with: EMAIL}
           
         validates :password,format: {with:/\A[a-z\d]{6,100}+\z/i, message: 'Include both letters and numbers'}
         
         validates :first_name,presence: true,format: {with:/\A[一-龥ぁ-ん]/, message: 'Full-width characters'}
         
         validates :last_name, presence: true,format: {with:/\A[一-龥ぁ-ん]/,message: 'Full-width characters'}
         
         validates :first_name_kana, presence: true,  format: {with:/\A[ァ-ヶー－]+\z/,message: 'Full-width katakana characters'}
         
         validates :last_name_kana, presence: true, format: {with:/\A[ァ-ヶー－]+\z/,message: 'Full-width katakana characters'}

         validates :birthday      , presence: true

         has_many :items
         has_many :orders
end
