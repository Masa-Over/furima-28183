class UserOrder
  include ActiveModel::Model
  attr_accessor :token, :prefecture_id, :municipalities, :address, :postal_code, :phone_number, :building, :user_id, :item_id



  with_options presence: true do
    validates :prefecture_id, numericality: { other_than: 1 }
    validates :municipalities
    validates :address
    validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :phone_number, numericality: { only_integer: true }
    validates :phone_number, length: {maximum: 11}
    validates :item_id
    validates :user_id
    validates :token
    #validates :purchase_record
  end
  
  def save
    purchase_record = PurchaseRecord.create(user_id: user_id, item_id: item_id)
    StreetAddress.create(prefecture_id: prefecture_id, municipalities: municipalities, address: address, postal_code: postal_code, phone_number: phone_number,building: building, purchase_record_id: purchase_record.id )
  end
  #上から順番に処理される、下は上の変数からidを持ってきている
end