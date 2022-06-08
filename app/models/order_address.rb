class OrderAddress
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :postal_code, :item_prefecture_id, :city, :addresses, :building, :phone_number, :token

  with_options presence: true do
    validates :user_id, :item_id, :city, :addresses, :token
    validates :postal_code, format: { with: /\A\d{3}-\d{4}\z/, message: 'is invalid. Include hyphen(-)' }
    validates :item_prefecture_id, numericality: { other_than: 1, message: "can't be blank" }
    validates :phone_number, numericality: { only_integer: true }, length: { in: 10..11 }
  end

  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    Address.create(postal_code: postal_code, item_prefecture_id: item_prefecture_id, city: city, addresses: addresses,
                   building: building, phone_number: phone_number, order_id: order.id)
  end
end
