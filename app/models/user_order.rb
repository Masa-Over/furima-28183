class UserOrder
  include ActiveModel::Model
  attr_accessor :token, :prefecture_id, :municipalities, :address, :postal_code, :phone_number, :building


  
  with option presence: true do
    validates :prefecture, numericality: { other_than: 0, message: "can't be blank" }
    validates :municipalities
    validates :address
    validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :phone_number
    validates :purchase_record
  end
  
  def save
    @item = Item.create(name: name, explanation: explanation, price: price,category_id: category_id, status_id:status_id, delivery_fee_id: delivery_fee_id, prefecture_id: prefecture_id, send_day_id: send_day_id, image: image)
    StreetAddress.create(prefecture_id: prefecture_id, municipalities: municipalities, address: address, postal_code: postal_code, phone_number: phone_number,building: building, purchase_record: purchase_record )
    PuchaseRecord.create(user_id: user_id, item_id: item_id)
  end
end