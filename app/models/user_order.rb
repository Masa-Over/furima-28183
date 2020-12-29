class UserOrder
  include ActiveModel::Model
  attr_accessor :prefecture_id, :municipalities, :address, :postal_code, :phone_number, :building, :user, :item

  with_options presence: true do
    validates :nickname, length: {maximum: 40}
    validates :birthday
    end
    with_options presence: true, format: { with: /\A[ぁ-んァ-ン一-龥]+\z/, message: '全角文字を使用してください' } do
      validates :firstname
      validates :familyname
    end
    with_options presence: true, format: { with: /\A[ァ-ン一]+\z/, message: '全角カタカナを使用してください' } do
      validates :firstname_katakana
      validates :familyname_katakana
    end
    PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
    validates_format_of :password, with: PASSWORD_REGEX, message: 'には英字と数字の両方を含めて設定してください', length: { minimum: 6}
  
  with_options presence: true do
    validates :name, length: {maximum: 40}
    validates :explanation, length: {maximum: 1000}
    validates :price, numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to:9999999}
    validates :category_id, numericality: { other_than: 1 }
    validates :status_id, numericality: { other_than: 1 }
    validates :delivery_fee_id, numericality: { other_than: 1 }
    validates :prefecture_id, numericality: { other_than: 1 }
    validates :send_day_id, numericality: { other_than: 1 }
    validates :image

    validates :prefecture, numericality: { other_than: 0, message: "can't be blank" }
    validates :municipalities
    validates :address
    validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :phone_number
    validates :purchase_record
  end
  
  def save
    user = User.create(nickname: nickname, birthday: birthday, firstname: firstname, familyname: familyname, firstname_katakana: firstname_katakana, familyname_katakana: familyname_katakana)
    item = Item.create(name: name, explanation: explanation, price: price,category_id: category_id, status_id:status_id, delivery_fee_id: delivery_fee_id, prefecture_id: prefecture_id, send_day_id: send_day_id, image: image)
    StreetAddress.create(prefecture_id: prefecture_id, municipalities: municipalities, address: address, postal_code: postal_code, phone_number: phone_number,building: building, purchase_record: purchase_record)
    PuchaseRecord.create(user_id: user_id, item_id: item_id)
  end
end