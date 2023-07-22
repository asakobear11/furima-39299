class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates [:nickname, :last_name_kanji, :first_name_kanji, :last_name_kana, :first_name_kana, :birthday] presence: true

  validates :password, format: { with: /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i }  

  validates [:last_name_kanji, :first_name_kanji] format: { with: /\A[ぁ-んァ-ヶ一-龥]/+\z }

  validates [:last_name_kana, :first_name_kana] format: { with: /\A[ァ-ヶー－]+\z/ }
end
