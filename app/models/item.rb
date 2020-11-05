class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :condition
  belongs_to_active_hash :handling_charge
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :shipping_date
  belongs_to :user
  has_one_attached :image

  with_options presence: true do
    validates :name
    validates :description
    validates :image
    validates :price, numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }, format: { with: /\A[0-9]+\z/ }
  end

  with_options numericality: { greater_than: 1, message: 'を選んでください' } do
    validates :condition_id,      presence: true
    validates :category_id,       presence: true
    validates :prefecture_id, presence: true
    validates :shipping_date_id, presence: true
    validates :handling_charge_id, presence: true
  end
end
