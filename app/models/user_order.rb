class UserOrder
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :token, :price, :postal_code, :prefecture_id, :city, :street_number, :building_name, :phone_number

  with_options presence: true do
    validates :token
    validates :postal_code, format: { with: /\A\d{3}[-]\d{4}\z/, message: 'はハイフンを(-)を含んで記述してください。' }
    validates :prefecture_id, numericality: { other_than: 1, message: 'を選択してください' }
    validates :city
    validates :street_number
    validates :phone_number, format: { with: /\A[0-9]{10,11}\z/, message: 'は10桁か11桁の半角数字ハイフン(-)なしで入力してください ' }
  end

  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    Address.create(postal_code: postal_code, prefecture_id: prefecture_id, city: city, street_number: street_number, building_name: building_name, phone_number: phone_number, order_id: order.id)
  end
end
