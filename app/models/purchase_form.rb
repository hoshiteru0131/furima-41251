class PurchaseForm
  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture_id, :city, :address, :building, :phone_number, :user_id, :item_id, :token

  with_options presence: true do
    validates :postal_code, format: { with: /\A\d{3}-\d{4}\z/ }
    validates :prefecture_id, numericality: { other_than: 0 }
    validates :city
    validates :address
    validates :phone_number, format: { with: /\A\d{10,11}\z/ }
    validates :token
    validates :user_id
    validates :item_id
  end

  def save
    order = Order.create(user_id:, item_id:)

    return false unless order.persisted?

    ShippingAddress.create(
      postal_code:,
      prefecture_id:,
      city:,
      address:,
      building:,
      phone_number:,
      order_id: order.id
    )
  end
end
