class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname, presence: true
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :first_name_kana, presence: true
  validates :last_name_kana, presence: true
  validates :birth_date, presence: true

  has_many :items, dependent: :destroy

  validates :nickname, presence: true, length: { maximum: 40 }

  VALID_PASSWORD_REGEX = /\A[a-z0-9]+\z/i
  validates :password, format: { with: VALID_PASSWORD_REGEX }
end
