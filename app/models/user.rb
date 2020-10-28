class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         with_options presence:true do
           
         validates :nickname
        
           EMAIL = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
          validates :email, presence: true  , format: {with: EMAIL}

         validates :password,format: {with:/\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i, message: 'Include both letters and numbers'}
         FIRST_NAME = /\A[一-龥ぁ-ん]/
         validates :first_name,format: {with:FIRST_NAME, message: 'Full-width characters'}
         
         validates :last_name,format: {with:FIRST_NAME,message: 'Full-width characters'}
         NAME_KANA = /\A[ァ-ヶー－]+\z/
         validates :first_name_kana,format: {with:NAME_KANA,message: 'Full-width katakana characters'}
         
         validates :last_name_kana, format: {with:NAME_KANA,message: 'Full-width katakana characters'}

         validates :birthday 
         end
         has_many :items
         has_many :orders
end
