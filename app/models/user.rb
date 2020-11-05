class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :items, dependent: :destroy
  has_many :commnts
  has_many :purchases
  has_one  :address

  with_options presence: true do
    validates :nickname
    validates :birth_date
    validates :password, format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]{6,20}+\z/i, message: 'Include both letters and numbers' }

    with_options format: { with: /\A[ぁ-んァ-ン一-龥]/ } do
      validates :first_name
      validates :last_name
    end

    with_options format: { with: /\A[\p{katakana}\p{blank}ー－]+\z/, message: 'はカタカナで入力して下さい' } do
      validates :first_name_kana
      validates :last_name_kana
    end
  end
end
