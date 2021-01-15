class UserOrder
  include ActiveModel::Model
  attr_accessor :token, :prefecture_id, :municipalities, :address, :postal_code, :phone_number, :building, :user_id, :item_id



  with_options presence: true do
    validates :prefecture_id, numericality: { other_than: 0, message: "can't be blank" }
    validates :municipalities
    validates :address
    validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :phone_number
    validates :item_id
    validates :user_id
    #validates :purchase_record
  end
  
  def save
    StreetAddress.create(prefecture_id: prefecture_id, municipalities: municipalities, address: address, postal_code: postal_code, phone_number: phone_number,building: building, purchase_record: purchase_record )
    PurchaseRecord.create(user_id: user_id, item_id: item_id)
  end
end